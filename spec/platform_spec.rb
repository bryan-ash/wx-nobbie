require File.join(File.dirname(__FILE__), 'spec_helper')
require 'nobbie/wx/platform'

module Nobbie
  module Wx

    describe "Platform" do

      describe "basic execution" do
        
        it "Raises a pleasant exception on unsupported platform" do
          Wxruby2.send(:remove_const, :PLATFORM)
          Wxruby2::PLATFORM = "unsupported"

          lambda{ Nobbie::Wx::Platform.ensure_supported }.
            should raise_error("Sorry 'unsupported' is not currently supported, Nobbie-Wx is only available for the following platforms: [WXMSW,WXMAC]")
        end
        
      end

    end
    
  end
end
