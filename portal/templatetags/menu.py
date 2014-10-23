# -*- encoding: utf-8 -*-

from django.template.loader import render_to_string
from portal.utils.str_resolver import StrResolver
import settings
from conf.local_alexmak_hare import CONFIGURATIONS
from django import template

register = template.Library()


def recursive_menu_render(item):
    subitems_html = []
    if "subitems" in item:
        for subitem in item["subitems"]:
            subitems_html += [recursive_menu_render(subitem)]

    params = {
        "item" : item,
        "subitems_htmls" : subitems_html
    }
    return render_to_string("tags/menu_recursive.html", params)

@register.inclusion_tag('tags/menu.html', takes_context = True)
def menu(context):
    request = context['request']

    menu_sources = settings.MENU_SOURCES
    menu_items = []
    resolver = StrResolver()
    for src_str in menu_sources:
        t_menu_items = resolver.ResolveModuleMember(src_str)
        menu_items += t_menu_items

    subitems_htmls = []
    for subitem in menu_items:
        subitems_htmls += [recursive_menu_render(subitem)]


    return {"subitems_htmls" : subitems_htmls}