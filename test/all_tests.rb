
TEST = File.dirname(__FILE__)

$LOAD_PATH.unshift "#{TEST}/../lib"

require 'rubygems'
require 'nobbie/wx'
require 'test/unit'

Dir.glob("#{TEST}/suite/**/*.rb") { |file| require file }

Nobbie::Wx::Operations::EXECUTOR =
  Nobbie::Wx::Command::Executor.new(Nobbie::Wx::Command::ConsoleReporter.new)

Nobbie::Wx::ApplicationLauncher.new(ExampleApp.new).run
