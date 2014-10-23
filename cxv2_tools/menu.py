# -*- encoding: utf-8 -*-

from django.core.urlresolvers import reverse



MENU_ITEMS = [
    {
        "title" : "CXV2",
        "subitems" : [
            {
                "title" : "Import",
                "url" : reverse("cxv2-tools-list")
            },
            {
                "title" : "Export",
                "url" : reverse("cxv2-tools-export")
            }
        ]
    }
]