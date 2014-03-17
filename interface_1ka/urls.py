__author__ = 'user'

from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'interface_1ka.views.index', name="views-index"),
    url(r'^configData', 'interface_1ka.views.configData', name="views-config-data"),
    url(r'^getGraphData', 'interface_1ka.views.getGraphData', name="views-graph-data"),
    url(r'^getSearchWidget', 'interface_1ka.views.getSearchWidget', name="views-search-widget"),
    url(r'^addInstance/', 'interface_1ka.views.addInstance', name="views-add-inst"),
    url(r'^addRelation/', 'interface_1ka.views.addRelation', name="views-add-rel"),
    url(r'^addFragment/', 'interface_1ka.views.addFragment', name="views-add-frag"),
    url(r'^saveNode/', 'interface_1ka.views.saveNode', name="views-save-node"),
    url(r'^saveRelation/', 'interface_1ka.views.saveRelation', name="views-save-rel"),
    url(r'^saveGraph/', 'interface_1ka.views.saveGraph', name="views-save-graph"),
    url(r'^getObjAttributes/(?P<cid>\d+)/(?P<id>\d+)$', 'interface_1ka.views.getObjAttributes', name="views-object-attributes"),
    url(r'^getRelAttributes/(?P<cid>\d+)/(?P<id>\d+)$', 'interface_1ka.views.getRelAttributes', name="views-rel-attributes"),
    url(r'^deleteNode/(?P<cid>\d+)/(?P<id>\d+)$', 'interface_1ka.views.deleteNode', name="views-delete-node"),
    url(r'^deleteRelation/(?P<cid>\d+)/(?P<id>\d+)$', 'interface_1ka.views.deleteRelation', name="views-delete-rel"),
)
