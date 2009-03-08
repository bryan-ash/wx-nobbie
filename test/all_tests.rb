
TEST = File.dirname(__FILE__)

$LOAD_PATH.unshift "#{TEST}/../lib"

require 'rubygems'
require 'nobbie/wx'
require 'test/unit'

Dir.glob("#{TEST}/suite/**/*.rb") { |file| require file }

Nobbie::Wx::Command::Executor.reporter = Nobbie::Wx::Command::ConsoleReporter.new

Nobbie::Wx::ApplicationLauncher.new(ExampleApp.new).run
