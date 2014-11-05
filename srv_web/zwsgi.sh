uwsgi --socket main.sock --home ../venv --module main.wsgi --chmod-socket=666 --daemonize=main.log
