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
    exit = Nobbie::Wx::ApplicationLauncher.new.with_application { Thread.pass }
  end
end
