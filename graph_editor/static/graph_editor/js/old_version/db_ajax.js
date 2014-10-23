/**
 * Created by user on 12/25/13.
 */

main();
var testJson;


function loadConfigurationData() {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/configData",
        //data: "parentDir=" + dir,
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            graph_configuration_data = data;
            svg.append("defs")
                .append("rect")
                .attr("id", "square")
                .attr("x", -10)
                .attr("y", -10)
                .attr("width", 20)
                .attr("height", 20)
            svg.append("defs")
                .append("circle")
                .attr("id", "circle")
                .attr("cx", 0)
                .attr("cy", 0)
                .attr("r", 10)
            svg.append("defs")
                .append("polygon")
                .attr("id", "triangle")
                .attr("points", "0,-10 10,10 -10,10")
            svg.selectAll("use").data(graph_configuration_data[0]).enter()
                .append("use")
                .attr("xlink:href", function (d) {
                    return "#" + d.shape
                })
                .attr("fill", function (d) {
                    return d.color;
                })
                .attr("x", function (d) {
                    return d.x;
                })
                .attr("y", function (d) {
                    return d.y;
                })
                .attr("draggable", true)
                .on("mousedown", function (d) {
                    chosenCid = d.id;
                })
            svg.selectAll("text")
                .data(graph_configuration_data[0])
                .enter()
                .append("text")
                .text(function (d) {
                    return d.title;
                })
                .attr("x", function (d) {
                    return d.x + d.size;
                })
                .attr("y", function (d) {
                    return d.y + d.size;
                })
                .attr("font-family", "sans-serif")
                .attr("font-size", "13px")
                .attr("fill", "black");
            svg.append("g").selectAll("text")
                .data(graph_configuration_data[1])
                .enter()
                .append("text")
                .text(function (d) {
                    return d.title;
                })
                .attr("x", function (d) {
                    return d.x - 30;
                })
                .attr("y", function (d) {
                    return d.y - 2;
                })
                .attr("font-family", "sans-serif")
                .attr("font-size", "10px")
                .attr("fill", "black");
            svg.append("defs")
                .append("marker")
                .attr("id", "endmarker")
                .attr("viewBox", "0 -5 10 10")
                .attr("refX", 0)
                .attr("refY", -0)
                .attr("markerWidth", 3)
                .attr("markerHeight", 3)
                .attr("orient", "auto")
                .append("path")
                .attr("d", "M0,-5L10,0L0,5");
            svg.append("g")
                .selectAll("rect")
                .data(graph_configuration_data[1])
                .enter()
                .append("rect")
                .attr("width", 40)
                .attr("height", 15)
                .attr("x", function (d) {
                    return d.x - 37
                })
                .attr("y", function (d) {
                    return d.y - 7
                })
                .attr("style", "opacity:0.05")
                .on("click", function (d) {
                    var cids = [];
                    d.allowed_relations.forEach(function (rel) {
                        var cid = rel.from.cid;
                        if (cids.indexOf(cid) == -1) {
                            cids.push(cid);
                        }
                    })
                    selectTypeNodes(cids);
                    chosenRel = d;
                })
            svg.selectAll("polyline")
                .data(graph_configuration_data[1])
                .enter()
                .append("polyline")
                .attr("points", function (d) {
                    return d.x + "," + d.y + " " + (d.x - 30) + "," + d.y;
                    //return "0,0 30,0"
                })
                //  style="fill:none;stroke:black;stroke-width:3" />
                .attr("style", function (d) {
                    return "stroke:" + d.color + ";stroke-width:" + d.size;
                })
                .attr("class", function (d) {
                    return d.shape;
                })
                .attr("marker-end", function (d) {
                    return "url(#endmarker)";
                })
        }
    });
}

function loadGraphData() {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/getGraphData",
        //data: "parentDir=" + dir,
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            graph_data = data;
            refreshGraph();
            //.attr("marker-end", function(d) { return "url(#endmarker)"; });
        }
    });
}

function loadObjectConfigData(cid, id) {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/getObjAttributes/" + cid + "/" + id,
        //data: "parentDir=" + dir,
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            var attrs = data[0];
            var vals = data[1];
            $("#obj_config_info div div").remove();
            $.each(attrs,
                function (i, key) {
                    $('#obj_config_info div').append(
                        $("<div>" + key + ": <input type='" + key + "' name='" + key + "' value=" + vals[i] + "></div>")
                    );
                })
        }
    });
}

function loadSearchWidget() {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/getSearchWidget/",
        //data: "parentDir=" + dir,
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            $('#search').append(data);
            $("#ui-id-1").on("click", function (d) {
                cid = $("#search_string_cid").val();
                id = $("#search_string_id").val();
                zoomTo(cid, id);
                selectObject(cid, id);
            });
        }
    });
}

function addNewNode(cid, x, y) {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/addInstance/",
        data: {cid: cid, cx: Math.round(x), cy: Math.round(y)},
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            addNode(cid, data, x, y)
        }
    });
}
function addNewRel(cid, source, target) {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/addRelation/",
        data: {rcid: cid, from_cid: source.cid, from_id: source.id, to_cid: target.cid, to_id: target.id},
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            testJson = data;
            addRelation(cid, source.cid, source.id, target.cid, target.id);
        }
    });
}
function saveTheNode(save_node) {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/saveNode/",
        data: {node: JSON.stringify(save_node) },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            testJson = data;
            //addRelation(cid,source.cid,source.id,target.cid,target.id);
        }
    });
}
function saveAllGraph() {
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/saveGraph/",
        data: {nodes: JSON.stringify(graph_data[0]) },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            testJson = data;
            //addRelation(cid,source.cid,source.id,target.cid,target.id);
        }
    });
}
function deleteTheNode() {
    var cid = selected_object.cid;
    var id = selected_object.id;
    $.ajax({
        type: "GET",
        url: "http://0.0.0.0:8082/interface_1ka/deleteNode/" + cid + "/" + id,
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        },
        success: function (data) {
            if (data == "success")
                deleteNode(selected_object);
            else
                alert(data);
            //addRelation(cid,source.cid,source.id,target.cid,target.id);
        }
    });
}

function main() {
    //loadConfigurationData();
}