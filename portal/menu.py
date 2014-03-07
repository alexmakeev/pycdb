from django.core.urlresolvers import reverse

__author__ = 'alexmak'

MENU_ITEMS = [
    {
        "title" : "Home",
        "url" : reverse("index")
    }
]