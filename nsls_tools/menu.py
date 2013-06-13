from django.core.urlresolvers import reverse

__author__ = 'alexmak'

MENU_ITEMS = [
    {
        "title" : "NSLS",
        "subitems" : [
            {
                "title" : "Connector",
                "url" : reverse("nsls-types-connector")
            }
        ]
    }
]