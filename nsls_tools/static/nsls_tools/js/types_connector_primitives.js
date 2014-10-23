function ItemFrom(register, title, cid, id) {
    var ret = DynamicUIObject(register);
    ret.class_name = "ItemFrom"
    ret.title = title
    ret.cid = cid
    ret.id = id
    ret.load_template_by_html_element("main", "#tmpl_item_from")

    ret.on_redraw.add(function () {
        var ret_elem = $("[p_uid=" + ret.uid + "]")
        ret_elem.removeClass("connected");
        ret_elem.addClass("not_connected");
        var through_place = ret_elem.children(".through_items")
        through_place.html("");
        var objs = register.objects_by_classes["ItemThrough"]
        for (var key in objs) {
            var t_obj = objs[key]
            if (t_obj.from_item_uid != ret.uid) continue
            var other_obj = register.get_uiobject(t_obj.to_item_uid)
            t_obj.render_by_template("main", {"uid": t_obj.uid, "target_title": other_obj.title}).appendTo(through_place)
            ret_elem.addClass("connected");
            ret_elem.removeClass("not_connected");
        }
    })
    // On create
    ret.on_create.add(function () {
        ret.render_by_template("main", {"uid": ret.uid, "title": title, "cid": cid, "id": id}).appendTo("#from_container")
    })
    ret.on_create.fire()
    return ret;
}

function ItemTo(register, title, cid, id) {
    var ret = DynamicUIObject(register);
    ret.class_name = "ItemTo"
    ret.title = title
    ret.cid = cid
    ret.id = id
    ret.load_template_by_html_element("main", "#tmpl_item_to")

    ret.on_redraw.add(function () {
        var ret_elem = $("[p_uid=" + ret.uid + "]")
        ret_elem.removeClass("connected");
        ret_elem.addClass("not_connected");
        var through_place = ret_elem.children(".through_items")
        through_place.html("");
        var objs = register.objects_by_classes["ItemThrough"]
        for (var key in objs) {
            var t_obj = objs[key]
            if (t_obj.to_item_uid != ret.uid) continue
            var other_obj = register.get_uiobject(t_obj.from_item_uid)
            t_obj.render_by_template("main", {"uid": t_obj.uid, "target_title": other_obj.title}).appendTo(through_place)
            ret_elem.addClass("connected");
            ret_elem.removeClass("not_connected");
        }
    })
    // On create
    ret.on_create.add(function () {
        ret.render_by_template("main", {"uid": ret.uid, "title": title, "cid": cid, "id": id}).appendTo("#to_container")
    })
    ret.on_create.fire()
    return ret;
}

function ItemThrough(register, cid, id) {
    var ret = DynamicUIObject(register);
    ret.class_name = "ItemThrough"
    ret.from_item_uid = null;
    ret.to_item_uid = null;
    ret.cid = cid
    ret.id = id

    ret.load_template_by_html_element("main", "#tmpl_item_through")

    ret.on_create.fire()
    return ret;
}
