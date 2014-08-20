/**
 * Created by 1ka on 3/28/14.
 */
var ZOOMPYCDB = ZOOMPYCDB||{};
//создание пространства имен
ZOOMPYCDB.namespace = function (ns_string) {
    var parts = ns_string.split('.'),
        parent = ZOOMPYCDB,
        i;
    if (parts[0] === "ZOOMPYCDB") {
        parts = parts.slice(1);
    }
    for (i = 0; i < parts.length; i += 1) {
        if (typeof parent[parts[i]] === "undefined") {
            parent[parts[i]] = {};
        }
        parent = parent[parts[i]];
    }
    return parent;
};
ZOOMPYCDB.test;
ZOOMPYCDB.view_editor = true;
$(document).ready(function(){
    var storage = ZOOMPYCDB.Storage(),
        cookies = ZOOMPYCDB.Cookies(),
        temp_data = ZOOMPYCDB.TempData(cookies),
        scheme_view = ZOOMPYCDB.ScemeView(storage,{
            "canvas": d3.select("#palette"),
            "nodes": d3.select("#palette_nodes")
        }),
        graph_view = ZOOMPYCDB.GraphView(storage,{
            "canvas": d3.select("#graph_map"),
            "body": d3.select("body")
        }),
        object_view = ZOOMPYCDB.ObjectView({
            "storage": storage,
            "temp": temp_data
        },{
            "panel": $("#palette_header"),
            "search": $("#search")
        }),
        logger = ZOOMPYCDB.Logger({},{
            "message": $("#error_message")
        }),
        keyboard = ZOOMPYCDB.Keyboard({},{}),
        object_controller = ZOOMPYCDB.ObjectController({
            "storage": storage,
            "temp": temp_data
        },object_view),
        scheme_controller = ZOOMPYCDB.ScemeController({
            "storage": storage,
            "temp": temp_data
        },{
            "graph":graph_view
        }),
        graph_controller = ZOOMPYCDB.GraphController({
            "storage": storage,
            "temp": temp_data
        },{
            "graph":graph_view,
            "keyboard": keyboard
        });
});
