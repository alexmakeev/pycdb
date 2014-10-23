function UIObjectsRegister() {
    var ret = {
        max_uid: 0,
        objects: {},
        objects_by_classes: {},
        make_uid: function () {
            ret = this.max_uid;
            this.max_uid += 1;
            return ret;
        },
        register_uiobject: function (obj) {
            this.objects[obj.uid] = obj;
            if (!(obj.class_name in this.objects_by_classes)) this.objects_by_classes[obj.class_name] = {};
            this.objects_by_classes[obj.class_name][obj.uid] = obj;
        },
        unregister_uiobject: function (obj) {
            delete this.objects[obj.uid];
            delete this.objects_by_classes[obj.class_name][obj.uid];
        },
        get_uiobject: function (uid) {
            return this.objects[uid];
        }
    };
    return ret;
}

function DynamicUIObject(global_ui_objects_register) {
    var ret = {
        uid: global_ui_objects_register.make_uid(),
        class_name: "unnamed",
        attributes: {},
        templates: {},
        on_create: $.Callbacks(),
        on_modify: $.Callbacks(),
        on_redraw: $.Callbacks(),
        on_delete: $.Callbacks(),
        load_template_by_html_element: function (template_name, element) {
            this.templates[template_name] = $.template($(element).html());
        },
        render_by_template: function (template_name, data) {
            return $.tmpl(this.templates[template_name], data)
        }
    }
    // On create
    ret.on_create.add(function () {
        global_ui_objects_register.register_uiobject(ret);
    })
    // On delete
    ret.on_delete.add(function () {
        global_ui_objects_register.unregister_uiobject(ret);
    })
    return ret;
}