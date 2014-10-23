# -*- encoding: utf-8 -*-

import simplejson
from django.core.exceptions import ValidationError
from django.forms import Field, Widget
from django.template.loader import render_to_string


def GetHtmlDictionaryInput(name, value):
    params = {
        "field_name": name,
        "field_value": simplejson.dumps(value),
    }
    ret = render_to_string("input_widgets/dictionary_input.html", params)
    return ret


class DictionaryInputWidget(Widget):
    def render(self, name, value, attrs=None):
        """
        Returns this Widget rendered as HTML, as a Unicode string.
        """
        if value is None:
            value = {}
        return GetHtmlDictionaryInput(name, value)


class DictionaryInputField(Field):
    widget = DictionaryInputWidget

    def __init__(self, *args, **kwargs):
        super(DictionaryInputField, self).__init__(*args, **kwargs)

    def prepare_value(self, value):
        ret = value
        if not value: value = {}
        if type(value) != dict:
            try:
                ret = simplejson.loads(str(value))
            except (Exception):
                raise Exception("Couldn't prepare dictionary field %s" % str(value))
        return ret

    def to_python(self, value):
        value = super(DictionaryInputField, self).to_python(value)
        ret = {}
        try:
            ret = simplejson.loads(str(value))
        except (Exception):
            raise ValidationError(self.error_messages['invalid'])
        return ret
