/** * Created by 1ka on 4/5/14. */ZOOMPYCDB.namespace("ZOOMPYCDB.Keyboard");ZOOMPYCDB.Keyboard = function (model, elements) {    $(document).keydown(function (e) {        if (e.ctrlKey || e.metaKey) {            e.preventDefault();            if (e.keyCode == 67) {                $(document).trigger("ctrl+c");            }            else if (e.keyCode == 88) {                $(document).trigger("ctrl+x");            }            else if (e.keyCode == 86) {                $(document).trigger("ctrl+v");            }        }    });    return{    }}