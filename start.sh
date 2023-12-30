set -eu

VIRTUALENV=./env

if [ ! -d $VIRTUALENV ]; then
  python3 -m venv $VIRTUALENV
fi

if [ ! -f $VIRTUALENV/bin/pip ]; then
  curl --silent -show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | $VIRTUALENV/bin/python
bin

$VIRTUALENV/bin/pip install -r requirements.txt

$VIRTUALENV/bin/python3 wsgi.py