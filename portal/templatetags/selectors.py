# -*- encoding: utf-8 -*-

from conf.local_alexmak_hare import CONFIGURATIONS
from django import template

register = template.Library()


@register.inclusion_tag('tags/configuration_selector.html', takes_context = True)
def configuration_selector(context):
    request = context['request']
    selected_configuration = request.session['selected_configuration']
    keys = CONFIGURATIONS.keys()
    keys.sort()
    all_cfgs = []
    for key in keys:
        all_cfgs += [{"name" : key, "title" : CONFIGURATIONS[key].title}]

    return {'selected_configuration' : selected_configuration, "all_configurations" : all_cfgs}