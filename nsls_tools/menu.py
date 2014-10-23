# -*- encoding: utf-8 -*-

from django.core.urlresolvers import reverse



MENU_ITEMS = [
    {
        "title" : "NSLS",
        "subitems" : [
            {
                "title" : "Devices Connector",
                "url" : reverse("nsls-devices-connector")
            }
        ]
    }
]