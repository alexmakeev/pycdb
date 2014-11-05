from django.core.urlresolvers import reverse

__author__ = 'alexmak'

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