require 'rubygems'
require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../../lib'

require File.dirname(__FILE__) + '/../../test/suite/example_app'

require 'nobbie/wx'
include Nobbie::Wx

silent_reporter = Command::ConsoleReporter.new(StringIO.new)
  
Operations::EXECUTOR = Command::Executor.new(silent_reporter)

ApplicationLauncher.new(ExampleApp.new(false)).run
