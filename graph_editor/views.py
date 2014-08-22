__author__ = 'user'
import random
from django.http import HttpResponse
from annoying.decorators import JsonResponse
from portal.utils.array_helpers import getFirstOrNone
from annoying.decorators import render_to
from graph_editor.models import Object,ObjectClass,Configuration,Background,View
from graph_db.configurations import test_config
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from string import maketrans
import json
import sys

@render_to("graph_editor/index.html")
def index(request):
    conf = request.configuration
    request.session['view_id'] = None
#    devs = conf.getAllEntities("human")
#    dev = getFirstOrNone(devs)
#    data = dev.get_queryset()

    return {}

@render_to("graph_editor/choose_views.html")
def choose_views(request):
    conf = request.configuration

    return {}

@render_to("graph_editor/edit_view.html")
def edit_view(request,id):
    conf = request.configuration
    request.session['view_id'] = id
    
    return {}

#    page = Human.objects.get(pk=5)
#    page.data = {'title': 'test', 'type': 3}
#    page.save()
#    return JsonResponse(dev)
#    return HttpResponse(dev))

def configData(request):
    classes_list = []
    relations_list = []
    configuration_id = Configuration.objects.get(name=request.configuration.__class__.__name__).id

    cids = request.configuration.classes.keys()
    cids.sort()
    for cls_id in cids:
        cls_info = request.configuration.classes[cls_id]
        cls_model_info = ObjectClass.objects.get(cid=cls_id,config=configuration_id)
        if cls_info["type"] == "entity_class":
            classes_list += [{
                "id": cls_id,
                "title": cls_info["name"],
                "description": cls_info["description"],
                "shape": cls_model_info.shape,
                "x": cls_model_info.x,
                "y": cls_model_info.y,
                "color": cls_model_info.color,
                "size": cls_model_info.size,
                "image": cls_model_info.image,
                "scale": cls_model_info.scale
            }]
        else:
            relations_list += [{
                "id": cls_id,
                "title": cls_info["name"],
                "description": cls_info["description"],
                "shape": cls_model_info.shape,
                "x": cls_model_info.x,
                "y": cls_model_info.y,
                "color": cls_model_info.color,
                "size": cls_model_info.size,
                "allowed_relations": cls_info["allowed_relations"]
            }]
    return JsonResponse({"nodes":classes_list,"rels":relations_list})


def getViewsData(request):
    views_list = []
    configuration_id = Configuration.objects.get(name=request.configuration.__class__.__name__).id
    views = View.objects.filter(config=configuration_id)
    for v in views:
        views_list += [{
            "id": v.id,
            "name": v.name,
            "image": v.image
        }]
    return JsonResponse({"data":views_list})


def getGraphData(request):
    data = request.GET
    nodes_list = []
    relations_list = []
    backgrounds_list = []
    configuration = Configuration.objects.get(name=request.configuration.__class__.__name__).id
    trans = maketrans("","")
    view_id = data['view_id']
    the_view = None if (view_id=="") else View.objects.get(id=view_id)

    #cids = json.loads(data["cids"])
    cids = request.configuration.classes.keys()
    entities = []
    for cid in cids:
        entities += request.configuration.getAllEntities(cid)

    for en in entities:
        try:
            object_info = Object.objects.get(oid=str(en.getId()).translate(trans,'(|)| '),config=configuration,view=the_view)                
            nodes_list += [{
                "id": en.getId()[1],
                "cid": en.getId()[0],
                "title": en["name"],
                "x": object_info.x,
                "y": object_info.y,
                "color": object_info.color,
                "shape": object_info.shape,
                "size": object_info.size,
                "image": object_info.image,
                "scale": object_info.scale
                #"test": str(en.getId()).translate(maketrans("",""),'(|)| '),
            }]
            relations = request.configuration.getAllRelations(en,None,None,True,"from")
            for rel in relations:
                for node in nodes_list:
                    from_ent = rel.getFromEntity().getId()
                    if from_ent[0]==node["cid"] and from_ent[1]==node["id"]:
                        relations_list += [{
                            "id": rel.getId()[1],
                            "source": from_ent,
                            "target": rel.getToEntity().getId(),
                            "cid": rel.getId()[0],
                        }]
            relations = request.configuration.getAllRelations(en,None,None,True,"to")
            for rel in relations:
                for node in nodes_list:
                    to_ent = rel.getToEntity().getId()
                    if to_ent[0]==node["cid"] and to_ent[1]==node["id"]:
                        relations_list += [{
                            "id": rel.getId()[1],
                            "source": rel.getFromEntity().getId(),
                            "target": to_ent,
                            "cid": rel.getId()[0],
                        }]
        except Exception,e:
            pass
    backgrounds = Background.objects.filter(config=configuration,view=the_view)
    for bg in backgrounds:
        backgrounds_list += [{
            "id": bg.id,
            "x": bg.x,
            "y": bg.y,
            "width": bg.width,
            "height": bg.height,
            "image": bg.image,
            "z": bg.z
        }]
    """        if(rel.getFromEntity().cid==2):
                rel.delete();
                return HttpResponse(relations)"""
    #return HttpResponse(Node.objects.get(id="1,45",config=configuration));
    return JsonResponse({'nodes':nodes_list,'rels':relations_list,'bgs':backgrounds_list})


def getObjAttributes(request,cid,id):
    cid = int(cid)
    id = int(id)
    attr_list = []
    attr_data_list = []
    class_info = request.configuration.classes[cid]
    entity = request.configuration.loadEntity(cid, id)
    protos = {}
    protos_values = {}
    types = []

    for attr in class_info["attributes"]:
        key = attr["name"]
        attr_list.append(key)
        attr_data_list.append(entity[key])
        types.append(attr["data_type"])
        protos[key] = key not in entity
        protos_values[key] = entity.get_default_attribute_value(key)

    return JsonResponse({
        "fields": attr_list,
        "vals": attr_data_list,
        "types": types,
        "protos": protos,
        "proto_vals": protos_values
    })


def getRelAttributes(request,cid,id):
    cid = int(cid)
    id = int(id)
    attr_list = []
    attr_data_list = []
    class_info = request.configuration.classes[cid]
    relation = request.configuration.loadRelation(cid, id)

    for attr in class_info["attributes"]:
        key = attr["name"]
        attr_list.append(key)
        attr_data_list.append(relation[key])

    return JsonResponse({
        "fields": attr_list,
        "vals": attr_data_list
    })


def getSearchWidget(request):
    input_widget = GetHtmlEntityIdSelector(request, "search_string")
    return JsonResponse(input_widget)

def addView(request):
    configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
    new_view = View(config=configuration)
    new_view.save()
    return HttpResponse()


def addInstance(request):
    data=request.GET
    node = json.loads(data["node"])
    new_inst = request.configuration.makeEntity(node["cid"])
    new_inst["name"] = node["title"]
    new_inst.save()
    new_id = new_inst.id
    configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
    new_model = Object(oid=str(node["cid"])+","+str(new_id),config=configuration,color=node["color"],size=node["size"],shape=node["shape"],x=node["x"],y=node["y"],scale=node["scale"])
    new_model.save()
    return HttpResponse(new_id)
    #return HttpResponse(node)


def addRelation(request):
    data = request.GET
    rel = json.loads(data["rel"])
    ent1 = request.configuration.loadEntity(rel["source"][0], rel["source"][1])
    ent2 = request.configuration.loadEntity(rel["target"][0], rel["target"][1])
    relation = request.configuration.makeRelation(rel["cid"], ent1, ent2)
    relation.save()
    return HttpResponse(relation.getId())


def addBackground(request):
    data=request.GET
    bg = json.loads(data["bg"])
    view_id = data['view_id']
    the_view = None if (view_id=="") else View.objects.get(id=view_id)
    configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
    new_model = Background(config=configuration,view=the_view,x=bg["x"],y=bg["y"],z=bg["z"],width=bg["width"],height=bg["height"],image=bg["image"])
    new_model.save()
    new_id = new_model.id
    return HttpResponse(new_id)


def addFragment(request):
    data = request.GET
    fragment = json.loads(data["fragment"])
    nodes = fragment["nodes"]
    relations = fragment["rels"]
    view_id = data['view_id']
    the_view = None if (view_id=="") else View.objects.get(id=view_id)
    for node in nodes:
        if the_view == None:
            new_inst = request.configuration.makeEntity(node["cid"])
            new_inst["name"] = node["title"]
            new_inst.save()
            new_id = new_inst.id
        else:
            new_id = node["id"]
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        try:
            Object.objects.get(oid=str(node["cid"])+","+str(new_id),config=configuration,view=the_view)
        except Exception:
            new_model = Object(oid=str(node["cid"])+","+str(new_id),config=configuration,color=node["color"],size=node["size"],shape=node["shape"],x=node["x"],y=node["y"],view=the_view)
            new_model.save()
        if the_view == None:
            for rel in relations:
                if rel["source"][0]==node["cid"] and rel["source"][1]==node["id"]:
                    rel["source"][1] = new_id
                if rel["target"][0]==node["cid"] and rel["target"][1]==node["id"]:
                   rel["target"][1] = new_id
            node["id"] = new_id
    if the_view == None:
        for rel in relations:
            ent1 = request.configuration.loadEntity(rel["source"][0], rel["source"][1])
            ent2 = request.configuration.loadEntity(rel["target"][0], rel["target"][1])
            relation = request.configuration.makeRelation(rel["cid"], ent1, ent2)
            relation.save()
    return JsonResponse(fragment)


def saveNode(request):
    result = "success"
    try:
        data = request.GET
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        node = json.loads(data["node"])
        view_id = data['view_id']
        the_view = None if (view_id=="") else View.objects.get(id=view_id)
        if(the_view==None):
            attrs = json.loads(data["attrs"])
            ent = request.configuration.loadEntity(node["cid"], node["id"])
            class_info = request.configuration.classes[node["cid"]]
            for attr in class_info["attributes"]:
                key = attr["name"]
                if attrs[key]=="default":
                    if(key in ent):
                       del ent.attributes[key]
                else:
                    ent[key] = attrs[key]
            ent.save();
        
        obj = Object.objects.get(oid=str(node["cid"])+","+str(node["id"]),config=configuration,view=the_view)
        obj.color=node["color"]
        obj.shape=node["shape"]
        obj.size=node["size"]
        obj.image=node["image"]
        obj.scale=node["scale"]
        obj.save()
    except Exception,e:
        result = e
    return HttpResponse(result)


def saveBg(request):
    result = "success"
    try:
        data = request.GET
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        bg = json.loads(data["bg"])

        obj = Background.objects.get(id=bg["id"],config=configuration)
        obj.x=bg["x"]
        obj.y=bg["y"]
        obj.height=bg["height"]
        obj.width=bg["width"]
        obj.image=bg["image"]
        obj.z=bg["z"]
        obj.save()
    except Exception,e:
        result = e
    return HttpResponse(result)


def saveView(request):
    result = "success"
    try:
        data = request.GET
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        view = json.loads(data["view"])

        obj = View.objects.get(id=view["id"],config=configuration)
        obj.name=view["name"]
        obj.image=view["image"]
        obj.save()
    except Exception,e:
        result = e
    return HttpResponse(result)

def saveRelation(request):
    result = "success"
    try:
        data = request.GET
        rel = json.loads(data["rel"])
        relation = request.configuration.loadRelation(rel["cid"], rel["id"])

        class_info = request.configuration.classes[rel["cid"]]

        for attr in class_info["attributes"]:
            key = attr["name"]
            relation[key] = rel[key]
        relation.save()
    except Exception,e:
        result = e
    return HttpResponse(result)


def saveGraph(request):
    data = request.GET
    configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
    nodes = json.loads(data["nodes"])
    view_id = data['view_id']
    the_view = None if (view_id=="") else View.objects.get(id=view_id)
    for node in nodes:
        obj = Object.objects.get(oid=str(node["cid"])+","+str(node["id"]),config=configuration,view=the_view)
        obj.x=node["x"]
        obj.y=node["y"]
        obj.save()
    return HttpResponse(0)


def deleteNode(request,cid,id):
    result = "success"
    try:
        data = request.GET
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        view_id = data['view_id']
        the_view = None if (view_id=="") else View.objects.get(id=view_id)
        if the_view == None:
            request.configuration.loadEntity(int(cid), int(id)).delete()
            Object.objects.filter(oid=cid+","+id,config=configuration).delete()
        else:
            Object.objects.get(oid=cid+","+id,config=configuration,view=the_view).delete()
    except Exception,e:
        result = e
    return HttpResponse(result)


def deleteRelation(request,cid,id):
    result = "success"
    try:
        rel = request.configuration.loadRelation(int(cid),int(id))
        rel.delete()
    except Exception,e:
        result = e
    return HttpResponse(result)


def deleteView(request,id):
    result = "success"
    try:
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        obj = View.objects.get(id=id,config=configuration)
        obj.delete()
    except Exception,e:
        result = e
    return HttpResponse(result)


def deleteBg(request,id):
    result = "success"
    try:
        configuration = Configuration.objects.get(name=request.configuration.__class__.__name__)
        obj = Background.objects.get(id=id,config=configuration)
        obj.delete()
    except Exception,e:
        result = e
    return HttpResponse(result)