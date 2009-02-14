require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../lib"
$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../test/suite"

require 'nobbie/wx'
require 'example_app'

Nobbie::Wx::ApplicationLauncher.new(ExampleApp.new).run
