Don't create __init__.py file here. If you do so, some libraries will be loaded twice.
All libraries should be imported assuming they are in global namespace, because libs dir is in PYTHON_PATH (see manage.py).

