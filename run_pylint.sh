#!/bin/bash
python3 -m venv ~/uda
source ~/uda/bin/activate
pip install --upgrade pip &&\
  pip install -r requirements.txt

pylint app.py