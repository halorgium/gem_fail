#!/usr/bin/env bash

set -o xtrace
set -x
set -e

(cd awesome_lib_gem
  rake package)

GEM_HOME=gems
GEM_PATH=gems
export GEM_HOME GEM_PATH

gem install -l awesome_lib_gem/pkg/awesome_lib-0.0.1.gem

echo "This should only load 'old_impl.rb'"
ruby dump.rb

echo "This should only load 'new_impl.rb'"
ruby -I lib dump.rb
