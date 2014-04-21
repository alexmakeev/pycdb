from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()


from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^import_export$', 'cxv2_tools.import_export.index', name="cxv2-import-export"),
    url(r'^import_export/import$', 'cxv2_tools.import_export.index', name="cxv2-import"),
    url(r'^export$', 'cxv2_tools.import_export.export', name="cxv2-tools-export"),
    url(r'^$', 'cxv2_tools.import_export.index', name="cxv2-tools-index"),
    url(r'^list$', 'cxv2_tools.import_export.list', name='cxv2-tools-list'),
    url(r'^list_save$', 'cxv2_tools.import_export.save', name='cxv2-tools-save'),
    url(r'^list/(?P<did>\d+)$', 'cxv2_tools.import_export.delete', name='cxv2-tools-delete'),
)


    # static files (images, css, javascript, etc.)
#urlpatterns += patterns('',
#    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
#        'document_root': settings.MEDIA_ROOT}))

