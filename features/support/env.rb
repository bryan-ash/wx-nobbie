require 'rubygems'
require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../../lib'
require 'nobbie/wx'

require File.dirname(__FILE__) + '/../../test/suite/example_app'

Nobbie::Wx::ApplicationLauncher.new(ExampleApp.new(false)).run
