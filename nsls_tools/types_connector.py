from annoying.decorators import render_to

__author__ = 'alexmak'

@render_to("nsls_tools/types_connector.html")
def index(request):
    return {}