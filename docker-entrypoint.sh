#/code/manage.py syncdb --noinput
/usr/local/bin/gunicorn djweb.wsgi:application -w 2 -b :8010