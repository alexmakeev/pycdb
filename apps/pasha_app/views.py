from annoying.decorators import render_to
from django.http import HttpResponse

__author__ = 'alexmak'


def my_filter(ent):
    return ent["name"] == "Pasha"

@render_to(template="pasha_template.txt", mimetype="text/plain")
def index(request):
    #serv = request.configuration.loadEntity("server", 2)

#    servs = request.configuration.getAllEntities("server", filter_func=my_filter)
#    serv = servs[0]

    ############################################################################################
    ### You can easily understand API by reading pycdb_kernel_apps/graph_db/configuration.py ###
    ############################################################################################
    ### Run me by http://127.0.0.1:8082/pasha/my_mega_url?selected_configuration=cxv2_config ###
    ############################################################################################

    gdb = request.configuration

    ### Removing old data
    old_servs = gdb.getAllEntities("server")
    for serv in old_servs:
        serv.delete()

    old_bc = gdb.getAllEntities("bus_controller")
    for bc in old_bc:
        bc.delete()

    ### Create new nodes
    t_servs = []
    for postfix in ["", "123", "123asd", "34_fm"]:
        serv = gdb.makeEntity("server")
        serv["readable_name"] = "Human Readable Name of Pasha with postfix \"%s\"" % postfix
        serv["name"] = "Pasha" + postfix
        serv.save()
        t_servs += [serv]

    bus_c = gdb.makeEntity("bus_controller")
    bus_c["readable_name"] = "BC of 123"
    bus_c.save()

    bus_c2 = gdb.makeEntity("bus_controller")
    bus_c2["readable_name"] = "BC of qweqwe"
    bus_c2.save()

    ### Create new relation
    relation = gdb.makeRelation("physical", t_servs[1], bus_c)
    relation["cable_length"] = "123 meters" ## setting attribute to relation EVEN not described in graph scheme
    relation.save()

    relation = gdb.makeRelation("physical", t_servs[1], bus_c2)
    relation.save()

    ### Query nodes
    all_servers = gdb.getAllEntities("server")
    servs = gdb.getAllEntities("server", filter_func=lambda ent: (ent["name"].startswith("Pasha12")))

    ### Query neighbours
    nbs = t_servs[1].getNeighbours() ## Using all available relation classes
    nbs = t_servs[1].getNeighbours("physical") ## Using just "physical" relations

    ### Query relations
    rels = gdb.findRelations("physical", t_servs[1], bus_c) ## Look for physical relations

    return {"all_servers": all_servers, "pasha_servers": servs, "nbs": nbs, "rels": rels}