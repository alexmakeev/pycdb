# -*- encoding: utf-8 -*-

from django.conf.urls.defaults import patterns, url

urlpatterns = patterns('',
                       url(r'^$', 'pasha_app.views.index', name="pasha-app-index"),
)

