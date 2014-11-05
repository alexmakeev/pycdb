from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'std_editor.views.index', name="std-editor-index"),
    url(r'^(?P<cid>\d+)/add$', 'std_editor.views.add_instance', name="std-editor-add-instance"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)$', 'std_editor.views.edit_instance', name="std-editor-edit-instance"),
    url(r'^(?P<cid>\d+)/(?P<id>\d+)/delete$', 'std_editor.views.delete_instance', name="std-editor-delete-instance"),


    url(r'^relations/(?P<rcid>\d+)/(?P<id>\d+)/delete$', 'std_editor.views.delete_relation', name="std-editor-delete-relation"),

    url(r'^(?P<cid>\d+)/list$', 'std_editor.views.list', name="std-editor-list"),
#(?P<year>\d{4})
)

