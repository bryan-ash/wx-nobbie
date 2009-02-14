
require File.join(File.dirname(__FILE__), 'spec_helper')
require 'nobbie/wx'

describe Nobbie::Wx::ApplicationLauncher do

  it "raises an exception if initialized with something other than a Wx::App" do
    lambda {
      Nobbie::Wx::ApplicationLauncher.new("this is not a Wx::App")
    }.should raise_error(RuntimeError, /.*be a.*Wx::App.*/)
  end

  it "stops the application under test after running it" do
    app_launcher = Nobbie::Wx::ApplicationLauncher.new(Wx::App.new)
    app_launcher.should_receive(:stop)
    app_launcher.run
  end

end
