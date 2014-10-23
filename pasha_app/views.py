# -*- encoding: utf-8 -*-

from django.http import HttpResponse


def my_filter(ent):
    return ent["name"] == "Pasha"


def index(request):
    # serv = request.configuration.loadEntity("server", 2)

    #    servs = request.configuration.getAllEntities("server", filter_func=my_filter)
    #    serv = servs[0]

    servs = request.configuration.getAllEntities("server",
                                                 filter_func=lambda ent: (ent["name"] == "Pasha" and ent["id"] == 2))
    serv = servs[0]

    return HttpResponse("All ok " % serv.getTitle())