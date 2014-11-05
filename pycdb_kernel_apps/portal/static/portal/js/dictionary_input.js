function DictionaryInput(prefix)
{
    var ret = {
        prefix : prefix,
        uiregistry : UIObjectsRegister(),
        rows : [],
        init_templates : function()
            {
                this.templates = {
                    row : $.template($("#" + prefix + "template [name=dynamic_table_row]").html()),
                }
            },
        row_delete : function(uid)
            {
                var item = this.uiregistry.get_uiobject(uid)
                item.on_delete.fire()
                var idx = $.inArray(item, this.rows) // Find the index
                if (idx != -1) this.rows.splice(idx, 1); // Remove it if found
                this.save_table();
                return false;
            },
        row_add : function(default_data, is_frozen, is_title)
            {
                var new_item = DynamicTableRowItem(this, default_data, is_frozen, is_title)
                this.rows.push(new_item);
                $("#" + prefix + "name_" + new_item.uid).focus();
                this.save_table();
                return false;
            },
        row_save : function(uid)
            {
                this.uiregistry.get_uiobject(uid).on_modify.fire();
                this.save_table();
                return false;
            },
        save_table : function()
            {
                var t_this = this;
                var result = {};
                $.each(this.rows, function(index,row){
                    if (row.attributes.key)
                    {
                        result[row.attributes.key] = row.attributes.value;
                    }
                })
                var result_json = JSON.stringify(result);
                $("#" + prefix + "table_data").val(result_json);
                return true;
            },
        load_table : function()
            {
                var t_this = this
                var data_str = $("#" + prefix + "table_data").val()
                var data = JSON.parse(data_str)
                $.each(data, function(key,value){
                    t_this.row_add({"key" : key, "value" : value})
                })

            }
    }
// adding Enter trigger to move focus and create new raws automatically
//    $(document).on('keypress', $("input"), function (e) {
//        if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
//
//            var inputs = $("#test_container input[type=text]")
//
//            var index = inputs.index($(this))
//            if (index+1 < inputs.length)
//            {
//                $(inputs[index+1]).focus()
//                return false;
//            }
//            else
//            {
//                ret.row_add()
//                return false;
//            }
//        }
//        return true;
//    });
    return ret;
}
var DynamicTableItem = function(table, default_data, is_frozen) //Base class of Row and Column
{
    var ret = DynamicUIObject(table.uiregistry);
    ret.attributes = {
        key : "",
        value : ""
    }
    ret.table = table;
    if (default_data)
    {
        $.each(default_data, function(key,value)
        {
            ret.attributes[key] = value;
        })
    }
    if (is_frozen) ret.is_frozen=true;
    return ret;
}

var DynamicTableRowItem = function(table, default_data, is_frozen, is_title)
{
    var ret = DynamicTableItem(table, default_data, is_frozen);
    var t_this = ret;

    //On Create
    ret.on_create.add(function(){
        $.tmpl(table.templates.row , {"uid" : t_this.uid, "css_class" : ""}).appendTo($("#" + table.prefix + "table_body"))
        t_this.on_redraw.fire();
    })

    //On Redraw
    ret.on_redraw.add(function(){
        $("#" + table.prefix + "key_"+t_this.uid).val(t_this.attributes["key"])
        $("#" + table.prefix + "value_"+t_this.uid).val(t_this.attributes["value"])
    })

    //On Modify
    ret.on_modify.add(function(){
        t_this.attributes["key"] = $("#" + table.prefix + "key_"+t_this.uid).val()
        t_this.attributes["value"] = $("#" + table.prefix + "value_"+t_this.uid).val()
    })

    //On Delete
    ret.on_delete.add(function(){
        $("#" + table.prefix + "uid_"+t_this.uid).remove();
    })

    // Fire on Create
    ret.on_create.fire()
    return ret;
}
