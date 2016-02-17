#!/bin/bash

set -eu

bundle install

npm install

bundle exec rake db:reset
