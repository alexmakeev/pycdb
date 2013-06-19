from annoying.decorators import render_to
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from annoying.decorators import JsonResponse
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from portal.utils.array_helpers import getFirstOrNone
from portal.utils.filters import getFilterNeighboursByClassName

__author__ = 'alexmak'

def updateConnType(request, conn_type, vals):
    title = vals["title"]
    from_cid = int(vals["from_cid"])
    from_id = int(vals["from_id"])
    to_cid = int(vals["to_cid"])
    to_id = int(vals["to_id"])

    conn_type["readable_name"] = title
    conn_type.save()

    from_dev = getFirstOrNone(conn_type.getNeighboursFrom(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))
    to_dev = getFirstOrNone(conn_type.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))

    if (from_dev and from_dev.getId()==(from_cid, from_id) and
        to_dev and to_dev.getId()==(to_cid, to_id)):
        return HttpResponse("Ok. Relations not changed")

    through_items = conn_type.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "connection_type_part"))
    for item in through_items:
        item.delete()
    old_relations = request.configuration.getAllRelations(conn_type, load_instances=True)
    for rel in old_relations:
        rel.delete()

    if from_cid!=0 and from_id!=0:
        from_entity = request.configuration.loadEntity(from_cid, from_id)
        rel_from = request.configuration.makeRelation("logical", from_entity, conn_type)
        rel_from.save()

    if to_cid!=0 and to_id!=0:
        to_entity = request.configuration.loadEntity(to_cid, to_id)
        rel_to = request.configuration.makeRelation("logical", conn_type, to_entity)
        rel_to.save()

    return HttpResponse("Ok. Relations erased")


################## BASE FUNCTIONALITY

@render_to("nsls_tools/types_connector.html")
def index(request):

    from_widget = GetHtmlEntityIdSelector(request, "from", cids_or_cnames_list=["device_type"], submit_form_on_select=False)
    to_widget = GetHtmlEntityIdSelector(request, "to", cids_or_cnames_list=["device_type"], submit_form_on_select=False)

    connection_types = request.configuration.getAllEntities("connection_type", load_instances=True)
    def sort_func(a,b):
        return cmp(a.getTitle(), b.getTitle())
    connection_types.sort(sort_func)

    ct = connection_types[0]

    return {"from_widget" : from_widget, "to_widget" : to_widget, "connection_types" : connection_types}

def add_connection_type(request):
    conn_type = request.configuration.makeEntity("connection_type")
    updateConnType(request, conn_type, request.POST)
    return HttpResponseRedirect(reverse("nsls-types-connector"))

def del_connection_type(request, cid, id):
    cid = int(cid)
    id = int(id)
    ent = request.configuration.loadEntity(cid, id)
    ent.delete()
    return HttpResponseRedirect(reverse("nsls-types-connector"))

@render_to("nsls_tools/types_connector_edit.html")
def edit_connection_type(request, cid, id):
    cid = int(cid)
    id = int(id)
    conn_type = request.configuration.loadEntity(cid, id)
    from_dev = getFirstOrNone(conn_type.getNeighboursFrom(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))
    to_dev = getFirstOrNone(conn_type.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))
    from_widget = GetHtmlEntityIdSelector(request, "from", cids_or_cnames_list=["device_type"], submit_form_on_select=False, value=from_dev)
    to_widget = GetHtmlEntityIdSelector(request, "to", cids_or_cnames_list=["device_type"], submit_form_on_select=False, value=to_dev)

    from_items = from_dev.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "link"))
    to_items = to_dev.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "channel"))
    through_items = conn_type.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "connection_type_part"))
    for item in through_items:
        item.from_item =  getFirstOrNone(item.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "link")))
        item.to_item =  getFirstOrNone(item.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "channel")))

    from_items.sort(lambda a,b: cmp(a.getTitle(), b.getTitle()))
    to_items.sort(lambda a,b: cmp(a.getTitle(), b.getTitle()))
    through_items.sort(lambda a,b: cmp(a.getTitle(), b.getTitle()))

    ret = {
        "conn_type" : conn_type,
        "from_widget" : from_widget,
        "to_widget" : to_widget,
        "from_items" : from_items,
        "to_items" : to_items,
        "through_items" : through_items,
    }

    return ret

def save_connection_type(request, cid, id):
    cid = int(cid)
    id = int(id)
    conn_type = request.configuration.loadEntity(cid,id)
    updateConnType(request, conn_type, request.POST)
    if "save_and_return" in request.POST:
        return HttpResponseRedirect(reverse("nsls-types-connector"))
    return HttpResponseRedirect(reverse("nsls-types-connector-edit", args=(cid, id)))

################## D&D FUNCTIONALITY

def save_connection_type_part(request, cid, id):
    cid = int(cid)
    id = int(id)
    from_cid = int(request.GET["from_cid"])
    from_id = int(request.GET["from_id"])
    to_cid = int(request.GET["to_cid"])
    to_id = int(request.GET["to_id"])
    conn_type = request.configuration.loadEntity(cid,id)
    t_from = request.configuration.loadEntity(from_cid,from_id)
    t_to = request.configuration.loadEntity(to_cid,to_id)

    conn_type_part = request.configuration.makeEntity("connection_type_part")
    conn_type_part.save()

    rel = request.configuration.makeRelation("composition", conn_type, conn_type_part)
    rel.save()

    rel = request.configuration.makeRelation("logical", conn_type_part, t_from)
    rel.save()

    rel = request.configuration.makeRelation("logical", conn_type_part, t_to)
    rel.save()
    ret = {"cid" : conn_type_part.cid, "id" : conn_type_part.id}
    return JsonResponse(ret)

def delete_connection_type_part(request, cid, id):
    cid = int(cid)
    id = int(id)
    conn_type = request.configuration.loadEntity(cid,id) # Just to check url correctness
    through_cid = int(request.GET["through_cid"])
    through_id = int(request.GET["through_id"])
    ent = request.configuration.loadEntity(through_cid, through_id)
    ent.delete()
    return HttpResponse("ok")

