pycdb - Python Configuration Database
=====

Python Configuration Database is a Python application, based on django 1.3.1 framework.

PyCDB consists of 3 base django applications: graph_db, portal, std_editor

===

**Requirements:**
- Python 2.7+ [http://www.python.org/download/]
- Django 1.3.* framework. [https://www.djangoproject.com/download/1.3.7/tarball/]
- nginx or other web-server, that supports FCGI protocol

===

**Installation:**

1\. Download the source code as zip or through git clone (ssh/https)

2\. Go to /conf and copy any local_*.py file to new file local_[installation_name].py where installation_name is a short description of a place you are installing PyCDB

3\. Edit local_[installation_name].py, you could overwrite any settings of common.py configuration file, also for first use you could erase all CONFIGURATIONS like this:

```python
CONFIGURATIONS = {}
```

*This is very useful to have common settings in repository and use small local settings files to overwrite their part.*

4\. Copy settings_example.py to settings.py

*settings.py is not stored in the repository, because it depends on every installation. So, you have to create it by copying example.*

5\. Replace line:

```python
from conf.local_alexmak_hare import *
```
with
```python
from conf.local_[installation_name] import *
```
*By this action you connect your local settings file to the application*

6\. Go to application root directory and run the command:
```
$ ./zsyncdb
```
*The SQLite database will be created and initialized. You will be asked for admin account information like username, email and password. The SQLite DB is used for storing users accounts, access permissions and other ifrastructure information.*

===


**Launching:**

To run debug server, go to application root directory and run the command:
```
$ ./zrun
```
*The server will run at all available ip-addresses on port 8082. For example, you could use http://127.0.0.1:8082*

**Deploying**

It is recommended to use nginx web-server with FCGI connection to django.

/// MORE INFO WILL BE ADDED SOON


**Creating Configuration**

1\. Go to graph_db/configurations directory.

2\. Create new [test_config].py file, where test_config is a short description of your software

3\. Make the configuration class. Example:

```python
from graph_db.configuration import Configuration, makeAttribute, makeAllowedRelation

class TestConfig(Configuration):
    def __init__(self):
        Configuration.__init__(self)
        self.addEntityClass(1, "pc", "PC", "Personal Computer", [
                makeAttribute("title", "Title", "Title of the PC", self.TYPE_STRING, ""),
            ])
        self.addEntityClass(2, "device", "Device", "Digital Device", [
                makeAttribute("title", "Title", "Title of the device", self.TYPE_STRING, ""),
            ])

        self.addRelationClass(101, "physical", "Physical", "Physical connections", [
            ], [
                makeAllowedRelation(
                    {"cname":"pc", "multiplicity" : self.MUL_ONE},
                    {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
                ),
            ])
```
*Full documentation of how to create configuration class you could find in the wiki of PyCDB.*

**Using Configuration**

1\. Go to conf/local_[installation_name] and find CONFIGURATIONS setting.

2\. Make a new configuration connection:

```python
CONFIGURATIONS = {
    "tst_config" : ConfigurationInfo("Test Configuration", "graph_db.configurations.test_config.TestConfig", PROJECT_DIR + "/graph_db/databases/test_config.gpickle"),
}
```

*CONFIGURATIONS is a dictionary of configuration connnections. Keys are connection names that are usable in automated scripts.*
*Value is an instance of ConfigurationInfo class that in its constructor accepts: connection title, dotted path to the configuration class and path, where the configuration data will be stored.*
*Full documentation of how to create configuration connections you could find in the wiki of PyCDB.*
