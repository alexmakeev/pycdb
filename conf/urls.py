# -*- encoding: utf-8 -*-

from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
# Uncomment the next two lines to enable the admin:
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
                       # Examples:
                       # url(r'^$', 'boxes.views.home', name='home'),
                       # url(r'^boxes/', include('boxes.foo.urls')),

                       # Uncomment the admin/doc line below to enable admin documentation:
                       # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

                       # Uncomment the next line to enable the admin:
                       # url(r'^portal/', include('portal.urls')),
                       # url(r'^transhette/', include('libs.transhette.urls')),

                       url(r'^admin/', include(admin.site.urls)),
                       url(r'^', include('portal.urls')),
                       url(r'^pasha/', include('pasha_app.urls')),
                       url(r'^std_editor/', include('std_editor.urls')),
                       url(r'^nsls_tools/', include('nsls_tools.urls')),
                       url(r'^cxv2_tools/', include('cxv2_tools.urls')),
                       url(r'^1ka/', include('interface_1ka.urls')),
                       url(r'^ge/', include('graph_editor.urls')),
)

urlpatterns += patterns('',
                        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
                            'document_root': settings.MEDIA_ROOT}))