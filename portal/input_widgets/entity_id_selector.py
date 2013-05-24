from time import sleep
import datetime
from annoying.decorators import JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from portal.utils.random_generators import GenerateRandomStr

def GetHtmlEntityIdSelector(request, name,cids_or_cnames_list=None, filter_func=None, submit_form_on_select=True):
    cids = []
    func = filter_func

    if cids_or_cnames_list:
        for cid_or_cname in cids_or_cnames_list:
            cids += [request.configuration.convertCNameIfNeeded(cid_or_cname)]

        # filter function
        def classes_filter_function(entity):
            if entity["cid"] not in cids: return False
            if filter_func: return filter_func(entity)
            return True

        func = classes_filter_function

    if "ajax_filters" not in request.runtime_data:
        request.runtime_data["ajax_filters"] = {}
    unique_str = GenerateRandomStr(1, request.runtime_data["ajax_filters"].keys())

    request.runtime_data["ajax_filters"][unique_str] = {
        "created" : datetime.datetime.now(),
        "filter_func" : func,
    }

    params = {
        "name" : name,
        "unique_str" : unique_str,
        "submit_form_on_select" : submit_form_on_select,
        }

    ret = render_to_string("input_widgets/entity_id_selector.html", params, context_instance=RequestContext(request))
    return ret

def AjaxGetSuggestionEntities(request):
#    print "GET", request.GET
#    print "POST", request.POST
    term = unicode(request.GET["term"])
    filter_func_id = request.GET["filter_func_id"]
    filter_func = request.runtime_data["ajax_filters"][filter_func_id]["filter_func"]

    ret = []

    def term_filter_func(ent):
        if filter_func and not filter_func(ent): return False
        #print term, unicode(ent), " === ", term in unicode(ent.values())
        return term.lower() in unicode(ent.values()).lower()

    ents = request.configuration.getAllEntities(filter_func=term_filter_func, load_instances=True)

    #print "SUGGESTIONS: ", ents

    for ent in ents:
        ret += [{
                    "cid" : ent.cid,
                    "id" : ent.id,
                    "class_name" : request.configuration.classes[ent.cid]["name"],
                    "title": ent.getTitle(20),
                    "description": ent.getDescription(15),
        }]

    return JsonResponse(ret)