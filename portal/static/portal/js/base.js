function UIObjectsRegister()
{
    var ret = {
        max_uid : 0,
        objects : {},
        make_uid : function(){
            ret = this.max_uid;
            this.max_uid += 1;
            return ret;
        },
        register_uiobject : function(obj){
            this.objects[obj.uid] = obj;
        },
        unregister_uiobject : function(obj){
            delete this.objects[obj.uid];
        },
        get_uiobject : function(uid){
            return this.objects[uid];
        }
    };
    return ret;
}

function DynamicUIObject(global_ui_objects_register)
{
    var ret = {
        uid : global_ui_objects_register.make_uid(),
        attributes : {},
        on_create : $.Callbacks(),
        on_modify :$.Callbacks(),
        on_redraw :$.Callbacks(),
        on_delete :$.Callbacks()
    }
    // On create
    ret.on_create.add(function(){
        global_ui_objects_register.register_uiobject(ret);
    })
    // On delete
    ret.on_delete.add(function(){
        global_ui_objects_register.unregister_uiobject(ret);
    })
    return ret;
}