import inspect

__author__ = 'alexmak'

class StrResolver():
    def ResolveModule(self, configuration_module_str):
        parts = configuration_module_str.split('.')

        ret_module = __import__(".".join(parts), fromlist=parts)

        return ret_module

    def ResolveModuleMember(self, configuration_class_str):
        parts = configuration_class_str.split('.')
        class_name = parts.pop()

        ret_module = __import__(".".join(parts), fromlist=parts)
        ret_list = inspect.getmembers(ret_module)

        for r in ret_list:
            if r[0]==class_name:
                return r[1]

        raise Exception("No configuration class with a name '%s' found in a module '%s'" % (class_name, ".".join(parts)))