__author__ = 'user'
from django.core.urlresolvers import reverse

MENU_ITEMS = [
    {
        "title" : "Interface",
        "subitems" : [
            {
                "title" : "Simple Export",
                "url" : reverse("views-index")
            }
        ]
    }
]