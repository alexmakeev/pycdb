__author__ = 'user'
from django.core.urlresolvers import reverse

MENU_ITEMS = [
              {
                    "title" : "Graph Editor",
                    "url" : reverse("views-index")
                    #"subitems" : [
                    #    {
                    #        "title" : "Graph Editor",
                    #        "url" : reverse("views-index")
                    #    }
                    #]
                    },
              {
               "title" : "Views Editor",
               "url" : reverse("views-choose-views")
               }
]