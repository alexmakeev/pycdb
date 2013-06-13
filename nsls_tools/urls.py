from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'nsls_tools.types_connector.index', name="nsls-types-connector"),

#    url(r'^widgets/entity_id_ajax$', 'portal.input_widgets.entity_id_selector.AjaxGetSuggestionEntities', name="widget-entity-id-ajax"),
)

