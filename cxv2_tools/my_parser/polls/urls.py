# -*- encoding: utf-8 -*-

from my_parser.polls import views


from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('',
    url(r'^$', views.index, name='index')
)