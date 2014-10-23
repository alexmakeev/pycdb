# -*- encoding: utf-8 -*-
import os

from utils import *
import common


DEBUG = True
TEMPLATE_DEBUG = DEBUG

PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))[:-5]  # cut "/conf" from the end
PROJECT_ROOT = os.path.realpath(os.path.dirname(__file__))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': PROJECT_DIR + '/storage.sqlite',  # Or path to database file if using sqlite3.
        'USER': '',  # Not used with sqlite3.
        'PASSWORD': '',  # Not used with sqlite3.
        'HOST': '',  # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',  # Set to empty string for default. Not used with sqlite3.
    }
}

STATIC_ROOT = PROJECT_DIR + '/static'

MEDIA_ROOT = os.path.join(PROJECT_DIR, 'media')
MEDIA_URL = '/media/'

EMAIL_SITE_ROOT_URL = "http://localhost:8082"
EMAIL_FROM = "pce.dev@gmail.com"

CONFIGURATIONS = {
    "tst_config": ConfigurationInfo("Test Configuration", "graph_db.configurations.test_config.TestConfig",
                                    PROJECT_DIR + "/graph_db/databases/nxgraph.gpickle"),
    "tst_config2": ConfigurationInfo("Test Configuration 2", "graph_db.configurations.test_config.TestConfig",
                                     PROJECT_DIR + "/graph_db/databases/nxgraph2.gpickle"),
    "nsls2_magnets": ConfigurationInfo("NSLS 2 - Magnets configuration",
                                       "graph_db.configurations.nsls2_magnets.NSLS2Magnets",
                                       PROJECT_DIR + "/graph_db/databases/nsls2_magnets.gpickle"),
    "nsls2_magnets_test": ConfigurationInfo("Test NSLS 2 - Magnets configuration",
                                            "graph_db.configurations.nsls2_magnets.NSLS2Magnets",
                                            PROJECT_DIR + "/graph_db/databases/nsls2_magnets_test.gpickle"),
    "cxv2_config": ConfigurationInfo("CXV2 ", "graph_db.configurations.cxv2_config.CXV2Config",
                                     PROJECT_DIR + "/graph_db/databases/cxv2_config.gpickle"),
}

common.INSTALLED_APPS += [
    'nsls_tools'
]

common.MENU_SOURCES += ["nsls_tools.menu.MENU_ITEMS", "std_editor.menu.MENU_ITEMS", "cxv2_tools.menu.MENU_ITEMS"]
