pip install -r requirements.txt
if [ -n "$1" ]
then
    echo "from main.settings_$1 import *" > srv_web/main/settings.py
else
    echo "Specify debug|dev|pub to make settings.py"
fi