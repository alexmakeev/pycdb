from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'nsls_tools.types_connector.index', name="nsls-types-connector"),
    url(r'^add_connection_type$', 'nsls_tools.types_connector.add_connection_type', name="nsls-types-connector-add"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)/edit$', 'nsls_tools.types_connector.edit_connection_type', name="nsls-types-connector-edit"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)/save$', 'nsls_tools.types_connector.save_connection_type', name="nsls-types-connector-save"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)/delete$', 'nsls_tools.types_connector.del_connection_type', name="nsls-types-connector-delete"),

    url(r'^(?P<cid>\d+)/(?P<id>\d+)/save_conn_type_part$', 'nsls_tools.types_connector.save_connection_type_part', name="nsls-types-connector-save-conn-type-part"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)/delete_conn_type_part$', 'nsls_tools.types_connector.delete_connection_type_part', name="nsls-types-connector-delete-conn-type-part"),


#    url(r'^widgets/entity_id_ajax$', 'portal.input_widgets.entity_id_selector.AjaxGetSuggestionEntities', name="widget-entity-id-ajax"),
)

