
$LOAD_PATH.unshift '../lib'

require 'rubygems'
require 'nobbie/wx/acceptance_test'
require_all_in_directory [File.dirname(__FILE__), 'suite'].join(File::SEPARATOR)

APPLICATION_UNDER_TEST = ExampleApp.new
