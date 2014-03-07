from south.modelsinspector import add_introspection_rules

try:
    from annoying.fields import JSONField
except ImportError:
    pass
else:
    #django-annoying's JSONField is essentially a OneToOneField.
    add_introspection_rules([], ["^annoying\.fields\.JSONField"])
