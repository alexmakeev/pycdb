# -*- encoding: utf-8 -*-

import os

from django.http import HttpResponse
from django.template.loader import render_to_string
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from django.conf import settings

from portal.utils.array_helpers import getFirstOrNone
from portal.utils.filters import getFilterNeighboursByClassName


def my_filter(ent):
    return ent["name"] == "psioc"


def get_config_channel(request, channel):
    ret = ""

    ret += channel.getTitle() + '\n'

    return ret


def get_config_device(request, device):
    ret = ""

    ret += device.getTitle() + '\n'

    device_type = getFirstOrNone(
        device.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))
    ret += device_type.getTitle() + '\n'

    channels = device_type.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "channel"))

    ret += "Channel count = " + str(len(channels)) + '\n'
    for channel in channels:
        ret += get_config_channel(request, channel)

    return ret


def get_config_ioc(request, ioc_name):
    ret = ""

    iocs = request.configuration.getAllEntities("ioc", filter_func=lambda ent: (ent["name"] == ioc_name))
    if ( len(iocs) != 1 ):
        ret += "Wrong IOC count. Found %s IOCs with the same name" % len(iocs)
        return ret

    ioc = iocs[0]

    devices = ioc.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "device"))
    ret += "Devices count = " + str(len(devices)) + '\n'
    for device in devices:
        ret += get_config_device(request, device)

    ret += "IOC Title = " + ioc.getTitle() + '\n'

    return ret


def index(request):
    # serv = request.configuration.loadEntity("server", 2)

    # servs = request.configuration.getAllEntities("server", filter_func=my_filter)
    #    serv = servs[0]

    #    servs = request.configuration.getAllEntities("server", filter_func=lambda ent: (ent["name"]=="psioc" and ent["id"]==2))
    #    serv = servs[0]

    response = ""

    ioc_name = "ps-br-6a"

    response += get_config_ioc(request, ioc_name)

    # servers = request.configuration.getAllEntities("server")

    # for server in servers:
    #     response += server.getTitle() + " "

    response += render_to_string("nsls_tools/db/device.tmpl", {'ioc': ioc_name})

    return HttpResponse(response)


class ProxyDevice:
    def __init__(self, device):
        self.device = device

    def get_name_with_brackets(self):
        return "{%s}" % self.device["name"]


def show_ioc(request, ioc_name):
    psc_list = []

    iocs = request.configuration.getAllEntities("ioc", filter_func=lambda ent: (ent["name"] == ioc_name))
    if len(iocs) != 1:
        raise Exception("Wrong IOC count. Found %s IOCs with name '%s'" % (len(iocs), ioc_name))

    ioc = iocs[0]
    tmpl = "nsls_tools/db/ioc/" + ioc["template"]

    blocks = {}
    for i in range(0, 101):
        blocks[i] = []

    devices = ioc.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "device"))
    for device in devices:
        proxy_device = ProxyDevice(device)
        dev_type = getFirstOrNone(
            device.getNeighbours(filter_func=getFilterNeighboursByClassName(request.configuration, "device_type")))
        tmpl_dir_name = dev_type["template"]
        tmpl_dir_short = "nsls_tools/db/devices/" + tmpl_dir_name
        tmpl_dir_full = settings.PROJECT_DIR + "/nsls_tools/templates/" + tmpl_dir_short

        for dirname, dirnames, filenames in os.walk(tmpl_dir_full):
            for filename in filenames:
                bin = int(filename.split(".")[0])
                rendered_str = render_to_string(tmpl_dir_short + "/" + filename, {"proxy": proxy_device})
                blocks[bin] += ["\n%s\n" % rendered_str]

                # psc_list += [t_dummy_device]

    return render_to_response(tmpl, {"ioc": ioc, "blocks": blocks}, context_instance=RequestContext(request))

