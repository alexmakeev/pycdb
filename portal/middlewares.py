import imp, os
import inspect
import sys
import random
import datetime
from graph_db.storage import Storage
from portal.utils.str_resolver import StrResolver
from settings import *

class SelectConfigurationMiddleware():
    def __init__(self):
        self.configuration = None
        self.runtime_data = {}
        self.unique_number = random.randint(0,100)
        self.saved = 1
        #print "MiddleWare created %s" % self.unique_number

    def __del__(self):
        #print "MiddleWare deleted"
        del self.configuration

    def process_request(self, request):
        if ("selected_configuration" not in request.session): request.session["selected_configuration"] = CONFIGURATIONS.keys()[0]

        if "selected_configuration" in request.GET:
            config_name = request.GET["selected_configuration"]
            if config_name not in CONFIGURATIONS:
                raise Exception("Configuration with name '%s' not found." % config_name)
            del self.configuration
            self.configuration = None
            request.session["selected_configuration"] = config_name

        if not self.configuration and request.session["selected_configuration"]:

            config_name = request.session["selected_configuration"]
            resolver = StrResolver()
            cfg_class = resolver.ResolveModuleMember(CONFIGURATIONS[config_name].configuration)
            self.configuration = cfg_class()
            strg = Storage(CONFIGURATIONS[config_name].storage)
            self.configuration.initialize(strg)

        if "ajax_filters" in self.runtime_data and len(self.runtime_data["ajax_filters"]) > 500:
            cur_time = datetime.datetime.now()
            for key in self.runtime_data["ajax_filters"].keys():
                if cur_time - self.runtime_data["ajax_filters"][key]["created"] > datetime.timedelta(days=7):
                    del self.runtime_data["ajax_filters"][key]

        request.configuration = self.configuration
        request.runtime_data = self.runtime_data
        self.saved = 0
        #print "Processing request %s" % request

    def process_response(self, request, response):
        if self.saved: return response
        #print "Processing response"
        if (request.configuration):
            request.configuration.storage.persist()
        self.saved = 1
        return response
