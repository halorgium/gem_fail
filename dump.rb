require 'pp'
require 'rubygems'

old = $".dup

require 'awesome_lib'

pp $" - old
