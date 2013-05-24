pycdb - Python Configuration Database
=====

Python Configuration Database is a Python application, based on django 1.3.1 framework. PyCDB consists of 3 base django applications: graph_db, portal, std_editor

===

**Requirements:**
- Python 2.7+ [http://www.python.org/download/]
- Django 1.3.* framework. [https://www.djangoproject.com/download/1.3.7/tarball/]
- nginx or other web-server, that supports FCGI protocol

===

**Installation:**

1\. Download the source code as zip or through git clone (ssh/https)

2\. Go to /conf and copy any local_*.py file to new file local_[installation_name].py where installation_name is a short description of a place you are installing PyCDB

3\. Edit local_[installation_name].py, you could overwrite any settings of common.py configuration file.

*This is very useful to have common settings in repository and use small local settings files to overwrite only some settings parameters.*

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

**Deploying**

It is recommended to use nginx web-server with FCGI connection to django.

/// MORE INFO WILL BE ADDED SOON

