/** * Created by 1ka on 4/5/14. */ZOOMPYCDB.namespace("ZOOMPYCDB.ObjectController");ZOOMPYCDB.ObjectController = function(model,view){    var storage = model.storage,        temp_data = model.temp,        view = view;    $(document).on("save_node_clicked",function(){        storage.saveNode(view.getNodeInfo());    });    $(document).on("delete_node_clicked",function(){        storage.deleteNode(temp_data.getObject());        view.clean();    });    $(document).on("save_rel_clicked",function(){        storage.saveRel(view.getRelInfo());    });    $(document).on("delete_rel_clicked",function(){        storage.deleteRelation(temp_data.getObject());        view.clean();    });    $(document).on("object_found",function(event,cid,id){        var node = storage.getNode(function(node){return ((node.cid==cid)&&(node.id==id));});        storage.unhighlight();        temp_data.setNode(node);        node.chosen = true;        storage.changeNode(node);        storage.zoomToNode(node);    });    $(document).on("find_neighbors",function(event,number){        if(number){            var object = temp_data.getObject();            storage.findAllNeighbors(object.cid,object.id,number);        }    });    return{    }}