from django import forms
from portal.input_widgets.dictionary_input import DictionaryInputField

class EditInstanceForm(forms.Form):
    def __init__(self, configuration, attributes, instance, *args, **kwargs):
        """
        :param configuration: configuration
        :param attributes: attributes list of an instance
        """
#        attributes = kwargs.pop('attributes')
#        configuration = kwargs.pop('configuration')
        super(EditInstanceForm, self).__init__(*args, **kwargs)

        for attribute in attributes:
            field_attrs = {
                "label" : attribute["readable_name"],
                "initial" : instance[attribute["name"]],

            }
            #print attribute["name"], instance[attribute["name"]]
            Cls = None
            if attribute["data_type"] == configuration.TYPE_INTEGER: Cls = forms.IntegerField
            if attribute["data_type"] == configuration.TYPE_DOUBLE: Cls = forms.FloatField
            if attribute["data_type"] == configuration.TYPE_STRING: Cls = forms.CharField
            if attribute["data_type"] == configuration.TYPE_DICTIONARY: Cls = DictionaryInputField

            self.fields[attribute["name"]] = Cls(**field_attrs)
