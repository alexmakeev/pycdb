pycdb - Python Configuration Database
=====

Python Configuration Database is a Python application, based on django 1.3.1 framework.

PyCDB consists of 3 base django applications: graph_db, portal, std_editor

===

**Requirements:**
- Python 2.7+ [http://www.python.org/download/]
- python-virtualenv

===

**Installation:**

1\. Download the source code as zip or through git clone (ssh/https)

2\. Install virtualenv and create onr in 'venv' folder (you can do it by running ./zinstall_once.sh)

3\. Activate virtualenv by running command: source ./venv/bin/activate

4\. Run install script by command: ./zinstall.sh debug

5\. Edit srv_web/main/settings_debug.py, for start from  use you could erase all CONFIGURATIONS like this:

```python
CONFIGURATIONS = {}
```

6\. Go to srv_web directory and run the command:
```
$ ./zsyncdb
```
*The SQLite database will be created and initialized. The SQLite DB is used for storing users accounts, access permissions and other ifrastructure information.*

===


**Launching:**

To run debug server, go to srv_web directory and run the command:
```
$ ./zrun
```
*The server will run at all available ip-addresses on port 8082. For example, you could use http://127.0.0.1:8082*

**Deploying**

It is recommended to use nginx web-server with UWSGI connection to django.

/// MORE INFO WILL BE ADDED SOON


**Creating Configuration**

1\. Go to srv_web/graph_dbs/configurations directory.

2\. Create new [test_config].py file, where test_config is a short description of your software

3\. Make the configuration class. Example:

```python
from graph_dbs.configuration import Configuration, makeAttribute, makeAllowedRelation

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

1\. Go to srv_web/main/settings_debug.py and find CONFIGURATIONS setting.

2\. Make a new configuration connection:

```python
CONFIGURATIONS = {
    "tst_config" : ConfigurationInfo("Test Configuration", "graph_dbs.configurations.test_config.TestConfig", PROJECT_DIR + "/graph_dbs/data/test_config.gpickle"),
}
```

*CONFIGURATIONS is a dictionary of configuration connnections. Keys are connection names that are usable in automated scripts.*
*Value is an instance of ConfigurationInfo class that in its constructor accepts: connection title, dotted path to the configuration class and path, where the configuration data will be stored.*
*Full documentation of how to create configuration connections you could find in the wiki of PyCDB.*
