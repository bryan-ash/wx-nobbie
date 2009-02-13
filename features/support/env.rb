require 'spec'

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../lib"
$LOAD_PATH.unshift File.dirname(__FILE__) + "/../../test/suite"

require 'example_app'

require 'nobbie/wx/application_launcher'

After do
  @app.exit_main_loop unless @app.nil?
end
