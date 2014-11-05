from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'pasha_app.views.index', name="pasha-app-index"),
)

