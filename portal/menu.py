# -*- encoding: utf-8 -*-

from django.core.urlresolvers import reverse


MENU_ITEMS = [
    {
        "title": "Home",
        "url": reverse("index")
    }
]