from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    url(r'^conn_types$', 'nsls_tools.types_connector.index', name="nsls-types-connector"),
    url(r'^conn_types/add$', 'nsls_tools.types_connector.add_connection_type', name="nsls-types-connector-add"),
    url(r'^conn_types/(?P<cid>\d+)/(?P<id>\d+)/edit$', 'nsls_tools.types_connector.edit_connection_type', name="nsls-types-connector-edit"),
    url(r'^conn_types/(?P<cid>\d+)/(?P<id>\d+)/save$', 'nsls_tools.types_connector.save_connection_type', name="nsls-types-connector-save"),
    url(r'^conn_types/(?P<cid>\d+)/(?P<id>\d+)/delete$', 'nsls_tools.types_connector.del_connection_type', name="nsls-types-connector-delete"),

    url(r'^conn_types/(?P<cid>\d+)/(?P<id>\d+)/save_conn_type_part$', 'nsls_tools.types_connector.save_connection_type_part', name="nsls-types-connector-save-conn-type-part"),
    url(r'^conn_types/(?P<cid>\d+)/(?P<id>\d+)/delete_conn_type_part$', 'nsls_tools.types_connector.delete_connection_type_part', name="nsls-types-connector-delete-conn-type-part"),

    url(r'^conns$', 'nsls_tools.devices_connector.index', name="nsls-devices-connector"),
    url(r'^conns/add$', 'nsls_tools.devices_connector.add_connection', name="nsls-devices-connector-add"),
    url(r'^conns/(?P<cid>\d+)/(?P<id>\d+)/delete$', 'nsls_tools.devices_connector.del_connection', name="nsls-devices-connector-delete"),

#    url(r'^widgets/entity_id_ajax$', 'portal.input_widgets.entity_id_selector.AjaxGetSuggestionEntities', name="widget-entity-id-ajax"),
)

