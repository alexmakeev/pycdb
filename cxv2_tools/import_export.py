from annoying.decorators import render_to
from django.core.context_processors import csrf
from django.shortcuts import render_to_response
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from portal.input_widgets.entity_id_selector import GetHtmlEntityIdSelector
from portal.utils.array_helpers import getFirstOrNone
from portal.utils.filters import getFilterNeighboursByClassName
from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader
import re
import ast
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from cxv2_tools.models import Document
from cxv2_tools.forms import DocumentForm
from cxv2_tools.utils import *

import sys

filename_expression = r"blklist-(?P<server_name>.+?)\.lst"
filename_re = re.compile(filename_expression, re.I)

blk_row_expression = r"^((\s*)|(\#.*)|(\s*(?P<filename>.+?)\s+(?P<driver>.+?)\s+(?P<bus_id>.+?)\s+(?P<main_info>.+?)\s+(?P<bigc_info>.+?)((\s*?)|(\s+(?P<aux_info>.+?)))))$"
blk_row_re = re.compile(blk_row_expression, re.I and re.M)



@render_to("../../cxv2_tools/templates/cxv2_tools/import_export.html")
def index(request):
    try:
        action_name = request.POST["value"]
    except Exception:
        action_name = ''


    file_name = 'blklist-linac1-1.lst'

    results = []

    if action_name == 'Export':
        action_name = 1

    if action_name == 'Import':
        results = parser(request, file_name)

    return {"action_name":  action_name, "results": results}


def parser(request, file_name):
    results = []
    f = open('/home/xukum/Documents/Nikita/configs/'+file_name,'r')
    data = ''.join(str(e) for e in f.readlines())
    return process_data(request, results, file_name, data)


def t_parser(file_name):
    results = []

    results.append("-------")
    results.append(str(file_name))
    results.append("-------")
    f = open('/home/xukum/Documents/Nikita/configs/'+file_name,'r')
    data = ''.join(str(e) for e in f.readlines())

    server_name = file_name
    for t_matchobj in re.finditer(filename_re, file_name):
        server_name = t_matchobj.groupdict()["server_name"]
        server_name = server_name.replace("-", ":")
    results.append("# " + server_name)

    results.append("# file	driver	bus_id	main_i  big_i   auxinfo")

    for t_matchobj in re.finditer(blk_row_re, data):
        line = t_matchobj.groupdict()
        t_str = str(line.pop('driver'))+" "+str(line.pop('bus_id'))+" "+str(line.pop('main_info'))+" "+str(line.pop('bigc_info'))+" "+str(line.pop('aux_info'))
        if t_str.find('None') <0:
            results.append(t_str)
    f.close()
    return results

def list(request):
    # Handle file upload
    results = []
#    c = {}
#    c.update(csrf(request))
    action_name = ''
    sys.stdout.write('FILES: '+str(request.POST)+' !!! \n')
    sys.stdout.write('FILES: '+str(request.FILES)+' !!! \n')
    if request.method == 'POST':
    ######## Import list of uploaded files
        try:
            action_name = request.POST["value"]
        except Exception:
            action_name = ''

#        sys.stdout.write(' }}} '+str(request.POST)+' }}} \n')
        file_names = getCheckedFileNames(request.POST)

        if action_name == 'Import':
            for file_name in file_names:
#                sys.stdout.write(' !!! '+str(file_name)+' !!! \n')
                results.append(parser(request, file_name))
        else:
        ######## Upload new file
            form = DocumentForm(request.POST, request.FILES)

            sys.stdout.write(' FORM: '+str(form)+' !!! \n')
            if form.is_valid():
                newdoc = Document(docfile = request.FILES['docfile'])
                newdoc.save()
            request.FILES.clear()
            request.POST.clear()
#            form.full_clean()
#           sys.stdout.write(' !!! '+str(file_name)+' !!! \n')


                # Redirect to the document list after POST
#            return render_to_response("cxv2_tools/list.html", c)
            return HttpResponseRedirect(reverse('cxv2_tools.import_export.list'))
    else:
        form = DocumentForm() # A empty, unbound form

    # Load documents for the list page
    documents = Document.objects.all()

    # Render list page with the documents and the form
    return render_to_response(
        'cxv2_tools/list.html',
        {'documents': documents, 'form': form, 'results': results},
        context_instance=RequestContext(request)
    )

def export(request):
    status = ''

    if request.method == 'POST':
        try:
            action = request.POST["Export"]
        except Exception:
            action = ''

        if action == 'Export':
            status = exportAllConfigFiles(request)

    return render_to_response(
        'cxv2_tools/export.html',
        { 'status': status},
        context_instance=RequestContext(request)
    )


def delete(request, did):
    # Handle file upload
    doc = Document.objects.get(id=did)
    doc.docfile.path
    doc.docfile.delete()
    doc.delete()

    # Load documents for the list page
    documents = Document.objects.all()

    # Render list page with the documents and the form
    return render_to_response(
        'cxv2_tools/list.html',
        {'documents': documents},
        context_instance=RequestContext(request)
    )


def getCheckedFileNames(POST):
#    sys.stdout.write(' *** '+str(POST.keys())+' ***\n')
    file_names = []
    for name in POST.keys():
        if 'check_' in name:
            mod_name = name.split('/')
#            sys.stdout.write('()()'+mod_name[-1]+'()()\n')
            file_names.append(mod_name[-1])

    return file_names