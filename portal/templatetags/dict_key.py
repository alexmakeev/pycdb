# -*- encoding: utf-8 -*-

# based on: http://www.djangosnippets.org/snippets/779/
from django.template import Library

register = Library()


@register.filter
def keyvalue(dict, key):
    return dict[key]