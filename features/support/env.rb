require 'rubygems'
require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../../lib'

require File.dirname(__FILE__) + '/../../test/suite/example_app'

require 'nobbie/wx'
include Nobbie::Wx

silent_reporter = Command::ConsoleReporter.new(StringIO.new)
  
Command::Executor.reporter = silent_reporter

ApplicationLauncher.new(ExampleApp.new(false)).run
