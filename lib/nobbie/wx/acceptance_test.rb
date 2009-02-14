require 'test/unit'
require 'nobbie/wx/operations'

def require_all_in_directory(dir)
  Dir.glob("#{dir}/**/*.rb") {|f| require "#{f}" }
end

class Test::Unit::TestCase
  include Nobbie::Wx::Operations
end

Test::Unit.run = false

#todo: how the hell does this work(/not work as expected) on OSX?
at_exit do
  unless $! || Test::Unit.run?
    Nobbie::Wx::ApplicationLauncher.new(APPLICATION_UNDER_TEST).run
  end
end
