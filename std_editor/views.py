from annoying.decorators import render_to
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from portal.input_widgets.dictionary_input import GetHtmlDictionaryInput
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from std_editor.forms import EditInstanceForm

__author__ = 'alexmak'

@render_to("std_editor/index.html")
def index(request):
    classes_list = []

    cids = request.configuration.classes.keys()
    cids.sort()
    for cls_id in cids:
        cls_info = request.configuration.classes[cls_id]
        if cls_info["type"] != "entity_class" : continue
        classes_list += [{
            "id" : cls_id,
            "title" : cls_info["readable_name"],
            "description" : cls_info["description"],
            "count" : len(request.configuration.getAllEntities(cls_id)),
        }]

    return {"classes_list" : classes_list}

def add_instance(request, cid):
    cid = int(cid)
    new_inst = request.configuration.makeEntity(cid)
    new_inst.save()
    new_id = new_inst.id
    return HttpResponseRedirect(reverse("std-editor-edit-instance", kwargs={"cid" : cid, "id" : new_id}))

def delete_instance(request, cid, id):
    cid = int(cid)
    id = int(id)
    entity = request.configuration.loadEntity(cid, id)
    entity.delete()
    messages.success(request, 'Instance deleted.')
    return HttpResponseRedirect(reverse("std-editor-list", kwargs={"cid" : cid}))

@render_to("std_editor/edit.html")
def edit_instance(request, cid, id):
    cid = int(cid)
    id = int(id)
    class_info = request.configuration.classes[cid]
    entity = request.configuration.loadEntity(cid, id)

    if request.method == "POST":
        #print request.POST
        form = EditInstanceForm(request.configuration, class_info["attributes"], entity, request.POST)
        if (form.is_valid()):
            for key in entity.attributes:
                entity.attributes[key]=form.cleaned_data[key]

            new_relations = {}
            for key in request.POST:
                if not key.startswith("new_rel_"): continue
                cid_or_id_value = int(request.POST[key])
                if cid_or_id_value <=0 : continue
                vals = key[8:].split("_")
                #print key, key[8:], vals
                cid = int(vals[0])
                entity_role = vals[1]
                neighbour_role = vals[3]
                cid_or_id_str = str(vals[-1])
                rel_key = "_".join(vals[:-1])
                if rel_key not in new_relations: new_relations[rel_key] = {}
                new_relations[rel_key][cid_or_id_str] = cid_or_id_value
                new_relations[rel_key]["rcid"] = cid
                new_relations[rel_key]["entity_role"] = entity_role
                new_relations[rel_key]["neighbour_role"] = neighbour_role

            entity.save()
            messages.success(request, 'Instance saved.')

            if new_relations:
                for rel_dict in new_relations.values():
                    ent1 = entity
                    ent2 = request.configuration.loadEntity(rel_dict["cid"], rel_dict["id"])
                    if rel_dict["entity_role"] != "from": (ent1, ent2) = (ent2, ent1) #swap
                    #print "adding rel:", ent1.getId(), ent2.getId()
                    rel = request.configuration.makeRelation(rel_dict["rcid"], ent1, ent2)
                    rel.save()

                messages.success(request, 'Relations saved.')
            if ("save_and_return" in request.POST):
                return HttpResponseRedirect(reverse("std-editor-list", kwargs={"cid" : cid}))
        else:
            messages.error(request, 'Please, fix the errors below.')
    else:
        form = EditInstanceForm(request.configuration, class_info["attributes"], entity)

    allowed_neighbours = request.configuration.getAllAllowedNeighboursPatternsByRelationsClassesIds(entity)
    relations = request.configuration.getAllRelations(entity)
    relations.sort(lambda a,b: cmp(a.id, b.id))

    cids = allowed_neighbours.keys()
    cids.sort()

    relations_infos = []
    for t_cid in cids:
        relation_info_by_cids = {
            "cid" : t_cid,
            "title" : request.configuration.classes[t_cid]["readable_name"],
            "relations" : [],
            "allowed_neighbours" : []
        }
        relations_dict = {}
        for rel in relations:
            if rel.cid != t_cid: continue
            t_role = "to"
            other_id = rel.to_id
            if rel.from_id!=entity.getId():
                t_role = "from"
                other_id = rel.from_id
            other = request.configuration.loadEntityByEntityId(other_id)
            t_rel = {
                "role" : t_role,
                "id" : rel.id,
                "cid" : rel.cid,
                "other_cid" : other.cid,
                "other_id" : other.id,
                "title" : other.getTitle(),
                "description" : other.getDescription(),
                "class_name" : request.configuration.classes[other.cid]["readable_name"]
            }
            key = (other.cid, t_role)
            if key not in relations_dict: relations_dict[key] = []
            relations_dict[key] += [t_rel]

        keys = relations_dict.keys()
        keys.sort()
        for key in keys:
            relations_list = relations_dict[key]
            relations_list.sort(lambda a,b: cmp(a["title"], b["title"]))
            relation_info_by_cids["relations"] += relations_list + [None]

        for neighbour_info in allowed_neighbours[t_cid]:
            entity_role = neighbour_info["entity_role"]
            neighbour_role = neighbour_info["neighbour_role"]
            neighbour_filter_data = neighbour_info["neighbour"]

            # callback to be saved in runtime memory to be reused by AJAX queries
            # Function is needed because lambda context has to be copied. So it is function that returns function with copied context =)
            def neighbour_filter(cid):
                return lambda ent: ent["cid"]==cid

            cls_info = request.configuration.classes[neighbour_filter_data["cid"]]

            neighbour = {
                "title" : "%s %s" % (neighbour_role, cls_info["readable_name"]),
                "input_widget" : GetHtmlEntityIdSelector(request, "new_rel_%s_%s_me_%s_%s" % (t_cid, entity_role, neighbour_role, cls_info["name"]), filter_func=neighbour_filter(neighbour_filter_data["cid"]))
            }
            relation_info_by_cids["allowed_neighbours"] += [neighbour]
        relations_infos += [relation_info_by_cids]


    return {"cid" : cid, "id" : id, "form" : form, "entity" : entity, "relations_infos" : relations_infos}

def delete_relation(request, rcid, id):
    rel = request.configuration.loadRelation(int(rcid), int(id))
    rel.delete()
    if "next" in request.GET:
        messages.success(request, 'Relation deleted.')
        return HttpResponseRedirect(request.GET["next"])
    return HttpResponse("Ok")

@render_to("std_editor/list.html")
def list(request, cid):
    cid = int(cid)
    entities = request.configuration.getAllEntities(cid)
    class_info = request.configuration.classes[cid]

    print "1", entities
    entities.sort(lambda a,b: cmp(a.getTitle(), b.getTitle()))
    print "2", entities

    return {"cid" : cid, "entities" : entities, "class_info" : class_info}