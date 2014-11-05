from django.core.urlresolvers import resolve
from django.shortcuts import get_object_or_404
from django.utils.translation import ugettext_lazy as _
import random


def common_variables(request):
    ret = {}

    rand_str = ""
    symbols = "ACDEFGHJKLMNPRSTUVWXYZ23456789"
    for i in range(0, 10):
        rand_str += symbols[random.randrange(0,len(symbols))]

    page_url = request.path
    match = resolve(page_url)

    ret["url_name"] = match.url_name
    ret["request"] = request
    ret["SESSION"] = request.session
    ret["PAGE_URL"] = page_url
    ret["USER"] = request.user
    ret["RAND_STR"] = rand_str
    return ret