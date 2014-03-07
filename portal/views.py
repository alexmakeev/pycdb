import datetime
from datetime import time
from annoying.decorators import render_to
from graph_db.configurations.test_config import TestConfig
from portal.utils.timer import Timer
from settings import CONFIGURATIONS
from graph_db.storage import Storage


@render_to(template="portal/index.html")
def index(request):
#    print request.configuration.storage.nxgraph.graph["edges_by_ids"]
#    timer = Timer()
#
#    timer.start("Init DB")
#    strg = Storage(CONFIGURATIONS["tst_config"].storage)
#    cfg = TestConfig()
#    cfg.initialize(strg)
#    timer.end("Init DB")
#
#    timer.start("Test filling")
#    prevs = []
#    ent = None
#    for i in range(1,100):
#        ent = cfg.makeEntity("human")
#        ent["name"] = "AlexMak %s" % i
#        ent["age"] = i
#        ent["weight"] = float(i)
#        ent.save()
#        for prev in prevs:
#            rel = cfg.makeRelation("friendship", prev, ent)
#            rel["strength"] = float(i)
#            rel.save()
#        prevs = prevs[-1:] + [ent]
#    timer.end("Test filling")
#
#    timer.start("Test loading")
#    ent = cfg.loadEntity("human", 2)
#    #ent.delete()
#    rel = cfg.findRelation("friendship", ent, cfg.loadEntity("human", 3))
#    #rel.delete()
#
#    ent = cfg.loadEntity("human", 3)
#    #print ent.attributes
#
#    neighbours = ent.getNeighboursFrom("friendship")
#    #print neighbours[0]
#
#    neighbours = ent.getNeighboursTo("friendship")
#    #print neighbours
#
#    neighbours = ent.getNeighbours("friendship")
#    #print neighbours
#
#    for n in neighbours:
#        rel = cfg.findRelation("friendship", ent, n)
#        rel.load()
#        #print rel.getRelationId()
#    timer.end("Test loading")
#
#    timer.start("Saving DB")
#    del strg
#    timer.end("Saving DB")
#
#    ret = {"nodes" : cfg.getAllEntities(), "edges" : "", "tst" : request.session["selected_configuration"], "timer_info" : "<br>".join(timer.get_info())}
#    return ret
    return {}
