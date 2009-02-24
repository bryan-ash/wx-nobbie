
$LOAD_PATH.unshift '../lib'

require 'rubygems'
require 'nobbie/wx'

require 'nobbie/wx/acceptance_test'
require_all_in_directory [File.dirname(__FILE__), 'suite'].join(File::SEPARATOR)

Nobbie::Wx::Operations::EXECUTOR =
  Nobbie::Wx::Command::Executor.new(Nobbie::Wx::Command::ConsoleReporter.new)

APPLICATION_UNDER_TEST = ExampleApp.new
