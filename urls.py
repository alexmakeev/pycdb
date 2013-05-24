from django.conf.urls.defaults import patterns, include, url

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
    #url(r'^portal/', include('portal.urls')),
    #url(r'^transhette/', include('libs.transhette.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('portal.urls')),
    url(r'^pasha/', include('pasha_app.urls')),
    url(r'^std_editor/', include('std_editor.urls')),
)
