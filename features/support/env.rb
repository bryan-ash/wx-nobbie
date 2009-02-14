require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../lib"
$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../test/suite"

require 'nobbie/wx'
require 'example_app'

# todo: remove?
After do
  @app.exit_main_loop unless @app.nil?
end
