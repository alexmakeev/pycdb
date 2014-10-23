# -*- encoding: utf-8 -*-

from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

from annoying.decorators import render_to
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from portal.utils.array_helpers import getFirstOrNone
from portal.utils.filters import getFilterNeighboursByClassName


@render_to("nsls_tools/devices_connector.html")
def index(request):
    recent_id = None
    if "recent_id" in request.GET: recent_id = int(request.GET["recent_id"])

    from_widget = GetHtmlEntityIdSelector(request, "from", cids_or_cnames_list=["device"], submit_form_on_select=False)
    through_widget = GetHtmlEntityIdSelector(request, "through", cids_or_cnames_list=["connection_type"],
                                             submit_form_on_select=False)
    to_widget = GetHtmlEntityIdSelector(request, "to", cids_or_cnames_list=["device"], submit_form_on_select=False)

    connections_list = request.configuration.getAllEntities("connection", load_instances=True)
    connections = []
    for conn in connections_list:
        t_conn = {
            "cid": conn.cid,
            "id": conn.id,
            "from": getFirstOrNone(
                conn.getNeighboursFrom(filter_func=getFilterNeighboursByClassName(request.configuration, "device"))),
            "through": getFirstOrNone(conn.getNeighbours(
                filter_func=getFilterNeighboursByClassName(request.configuration, "connection_type"))),
            "to": getFirstOrNone(
                conn.getNeighboursTo(filter_func=getFilterNeighboursByClassName(request.configuration, "device"))),
            "is_recent": recent_id == conn.id
        }
        connections += [t_conn]

    def sort_func(a, b):
        if (a["from"] and b["from"]):
            return cmp(a["from"].getTitle(), b["from"].getTitle())
        if (a["from"]): return cmp(1, 0)
        if (b["from"]): return cmp(0, 1)
        return cmp(a["id"], b["id"])

    connections.sort(sort_func)

    return {"from_widget": from_widget, "through_widget": through_widget, "to_widget": to_widget,
            "connections": connections}


def add_connection(request):
    vals = request.POST
    from_cid = int(vals["from_cid"])
    from_id = int(vals["from_id"])
    through_cid = int(vals["through_cid"])
    through_id = int(vals["through_id"])
    to_cid = int(vals["to_cid"])
    to_id = int(vals["to_id"])

    conn = request.configuration.makeEntity("connection")
    conn.save()

    if from_cid != 0 and from_id != 0:
        from_entity = request.configuration.loadEntity(from_cid, from_id)
        rel_from = request.configuration.makeRelation("logical", from_entity, conn)
        rel_from.save()

    if through_cid != 0 and through_id != 0:
        through_entity = request.configuration.loadEntity(through_cid, through_id)
        rel_through = request.configuration.makeRelation("type", conn, through_entity)
        rel_through.save()

    if to_cid != 0 and to_id != 0:
        to_entity = request.configuration.loadEntity(to_cid, to_id)
        rel_to = request.configuration.makeRelation("logical", conn, to_entity)
        rel_to.save()

    return HttpResponseRedirect(reverse("nsls-devices-connector") + "?recent_id=%s" % conn.id)


def del_connection(request, cid, id):
    cid = int(cid)
    id = int(id)
    conn = request.configuration.loadEntity(cid, id)
    conn.delete()
    return HttpResponseRedirect(reverse("nsls-devices-connector"))