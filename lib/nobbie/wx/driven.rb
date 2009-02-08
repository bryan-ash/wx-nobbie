require 'nobbie/wx/operations'

include Nobbie::Wx::Operations

def with_application
  Nobbie::Wx::ApplicationLauncher.new.with_application { yield }
end
