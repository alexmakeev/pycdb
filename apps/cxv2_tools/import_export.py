from annoying.decorators import render_to
from django.shortcuts import render_to_response
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.template import RequestContext, loader
import re
from cxv2_tools.models import Document
from cxv2_tools.forms import DocumentForm
from cxv2_tools.utils import *
from django.conf import settings
import sys

filename_expression = r"blklist-(?P<server_name>.+?)\.lst"
filename_re = re.compile(filename_expression, re.I)

blk_row_expression = r"^((\s*)|(\#.*)|(\s*(?P<filename>.+?)\s+(?P<driver>.+?)\s+(?P<bus_id>.+?)\s+(?P<main_info>.+?)\s+(?P<bigc_info>.+?)((\s*?)|(\s+(?P<aux_info>.+?)))))$"
blk_row_re = re.compile(blk_row_expression, re.I and re.M)



@render_to("/cxv2_tools/import_export.html")
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
    f = open(settings.MEDIA_ROOT+'/'+file_name,'r')
    data = ''.join(str(e) for e in f.readlines())
    return process_data(request, results, file_name, data)


def list(request):
    # Handle file upload
    results = []

    action_name = ''
    sys.stdout.write('FILES: '+str(request.POST)+' !!! \n')
    sys.stdout.write('FILES: '+str(request.FILES)+' !!! \n')
    if request.method == 'POST':
    ######## Import list of uploaded files

        try:
            action_name = request.POST["value"]
        except Exception:
            action_name = ''

        file_names = getCheckedFileNames(request.POST)
 #       urls = getChe
        if action_name == 'Import':
            for file_name in file_names:
                results.append(parser(request, file_name))
                form = DocumentForm()
        form = DocumentForm()

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

def save(request):
        ######## Upload new file
        form = DocumentForm(request.POST, request.FILES)

        sys.stdout.write(' FORM: '+str(form)+' !!! \n')
        if form.is_valid():
            newdoc = Document(docfile = request.FILES['docfile'])
            newdoc.save()
        return HttpResponseRedirect(reverse('cxv2_tools.import_export.list'))

def export(request):
    status = ''

    if request.method == 'POST':
        try:
            action = request.POST["export_type"]
        except Exception:
            action = ''

        if action == 'blk':
            status = exportAllConfigFiles(request, 'blk')
        sys.stdout.write('ACTIONS:'+action+'\n')

        if action == 'lst':
            status = exportAllConfigFiles(request, 'lst')

    return render_to_response(
        'cxv2_tools/export.html',
        { 'results': status},
        context_instance=RequestContext(request)
    )


def delete(request, did):
    results = {}
    # Handle file upload

    doc = Document.objects.get(id=did)
    doc.docfile.path
    doc.docfile.delete()
    doc.delete()
    form = DocumentForm()
    # Load documents for the list page
    documents = Document.objects.all()

    # Render list page with the documents and the form
    return render_to_response(
        'cxv2_tools/list.html',
        {'documents': documents, 'form': form, 'results': results},
        context_instance=RequestContext(request)
    )


def getCheckedFileNames(POST):
    file_names = []
    for name in POST.keys():
        if 'check_' in name:
            mod_name = name.split('_')
            print('MODE_NAME: '+str(mod_name))
            file_names.append(mod_name[1])
    return file_names