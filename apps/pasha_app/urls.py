from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^my_mega_url$', 'pasha_app.views.index', name="pasha-app-index"),
)

