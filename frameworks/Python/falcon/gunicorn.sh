#!/bin/bash

gunicorn -w 16 -b 0.0.0.0:8000 app:app
