#!/bin/sh

(cd celestrium && grunt) &&
grunt &&
python -m SimpleHTTPServer
