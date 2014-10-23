#!/usr/bin/env python
# Adding libs to PYTHON_PATH
import os
import sys

ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(ROOT, 'libs'))

from django.core.management import execute_manager
import imp

try:
    imp.find_module('settings')  # Assumed to be in the same directory.
except ImportError:
    import sys

    sys.stderr.write(
        "Error: Can't find the file 'settings.py' in the directory containing %r. It appears you've customized things.\nYou'll have to zrun django-admin.py, passing it your settings module.\n" % __file__)
    sys.exit(1)

import settings

if __name__ == "__main__":
    execute_manager(settings)
