__author__ = 'user'
import random
from django.http import HttpResponse
from annoying.decorators import JsonResponse
from portal.utils.array_helpers import getFirstOrNone
from annoying.decorators import render_to
from interface_1ka.models import Node,DefaultNode,Configurations
from graph_db.configurations import test_config
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from string import maketrans
import json
import sys

@render_to("interface_1ka/index.html")
def index(request):
    conf = request.configuration
#    devs = conf.getAllEntities("human")
#    dev = getFirstOrNone(devs)
#    data = dev.get_queryset()

    return {}

#    page = Human.objects.get(pk=5)
#    page.data = {'title': 'test', 'type': 3}
#    page.save()
#    return JsonResponse(dev)
#    return HttpResponse(dev))


def configData(request):
    classes_list = []
    relations_list = []
    configuration_id = Configurations.objects.get(name=request.configuration.__class__.__name__).id

    cids = request.configuration.classes.keys()
    cids.sort()
    for cls_id in cids:
        cls_info = request.configuration.classes[cls_id]
        cls_model_info = DefaultNode.objects.get(cid=cls_id,config=configuration_id)
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

    #return HttpResponse(request.configuration.__class__.__name__)
    return JsonResponse({"nodes":classes_list,"rels":relations_list})


def getGraphData(request):
    data = request.GET
    nodes_list = []
    relations_list = []
    configuration = Configurations.objects.get(name=request.configuration.__class__.__name__).id
    trans = maketrans("","")

    #cids = json.loads(data["cids"])
    cids = request.configuration.classes.keys()
    entities = []
    for cid in cids:
        entities += request.configuration.getAllEntities(cid)

    for en in entities:
        object_info = Node.objects.get(id=str(en.getId()).translate(trans,'(|)| '),config=configuration)
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
        relations = request.configuration.getAllRelations(en,None,None,True,"to")
        for rel in relations:
            relations_list += [{
                "id": rel.getId()[1],
                "source": rel.getFromEntity().getId(),
                "target": rel.getToEntity().getId(),
                "cid": rel.getId()[0],
            }]
    """        if(rel.getFromEntity().cid==2):
                rel.delete();
                return HttpResponse(relations)"""
    #return HttpResponse(Node.objects.get(id="1,45",config=configuration));
    return JsonResponse({'nodes':nodes_list,'rels':relations_list})


def getObjAttributes(request,cid,id):
    cid = int(cid)
    id = int(id)
    attr_list = []
    attr_data_list = []
    class_info = request.configuration.classes[cid]
    entity = request.configuration.loadEntity(cid, id)
    protos = {}
    protos_values = {}

    for attr in class_info["attributes"]:
        key = attr["name"]
        attr_list.append(key)
        attr_data_list.append(entity[key])
        protos[key] = key not in entity
        protos_values[key] = entity.get_default_attribute_value(key)

    return JsonResponse({
        "fields": attr_list,
        "vals": attr_data_list,
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


def addInstance(request):
    data=request.GET
    node = json.loads(data["node"])
    new_inst = request.configuration.makeEntity(node["cid"])
    new_inst["name"] = node["title"]
    new_inst.save()
    new_id = new_inst.id
    configuration = Configurations.objects.get(name=request.configuration.__class__.__name__)
    new_model = Node(id=str(node["cid"])+","+str(new_id),config=configuration,color=node["color"],size=node["size"],shape=node["shape"],x=node["x"],y=node["y"])
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


def addFragment(request):
    data = request.GET
    fragment = json.loads(data["fragment"])
    nodes = fragment["nodes"]
    relations = fragment["rels"]
    for node in nodes:
        new_inst = request.configuration.makeEntity(node["cid"])
        new_inst["name"] = node["title"]
        new_inst.save()
        new_id = new_inst.id
        configuration = Configurations.objects.get(name=request.configuration.__class__.__name__)
        new_model = Node(id=str(node["cid"])+","+str(new_id),config=configuration,color=node["color"],size=node["size"],shape=node["shape"],x=node["x"],y=node["y"])
        new_model.save()
        for rel in relations:
            if rel["source"][0]==node["cid"] and rel["source"][1]==node["id"]:
                rel["source"][1] = new_id
            if rel["target"][0]==node["cid"] and rel["target"][1]==node["id"]:
               rel["target"][1] = new_id
        node["id"] = new_id
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
        configuration = Configurations.objects.get(name=request.configuration.__class__.__name__)
        node = json.loads(data["node"])
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

        obj = Node.objects.get(id=str(node["cid"])+","+str(node["id"]),config=configuration)
        obj.color=node["color"]
        obj.shape=node["shape"]
        obj.size=node["size"]
        obj.image=node["image"]
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
    configuration = Configurations.objects.get(name=request.configuration.__class__.__name__)
    nodes = json.loads(data["nodes"])
    for node in nodes:
        obj = Node.objects.get(id=str(node["cid"])+","+str(node["id"]),config=configuration)
        obj.x=node["x"]
        obj.y=node["y"]
        obj.save()
    return HttpResponse(0)


def deleteNode(request,cid,id):
    result = "success"
    try:
        configuration = Configurations.objects.get(name=request.configuration.__class__.__name__)
        ent = request.configuration.loadEntity(int(cid), int(id))
        obj = Node.objects.get(id=cid+","+id,config=configuration)
        ent.delete()
        obj.delete()
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