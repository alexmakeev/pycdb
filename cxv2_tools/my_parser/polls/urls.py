# -*- encoding: utf-8 -*-

from django.conf.urls.defaults import patterns, url

from my_parser.polls import views


urlpatterns = patterns('',
                       url(r'^$', views.index, name='index')
)