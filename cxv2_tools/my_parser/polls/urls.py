from my_parser.polls import views

__author__ = 'xukum'
from django.conf.urls.defaults import patterns, include, url


urlpatterns = patterns('',
    url(r'^$', views.index, name='index')
)