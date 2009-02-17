require 'rubygems'
require 'wx'
require 'spec'

include Wx

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../lib"
$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../test/suite"

require 'nobbie/wx'
require 'example_app'

Nobbie::Wx::ApplicationLauncher.new(ExampleApp.new(false)).run
