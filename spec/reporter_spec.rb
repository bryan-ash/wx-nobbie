require File.join(File.dirname(__FILE__), 'spec_helper')
require 'nobbie/wx'
require 'nobbie/wx/command/reporter'

module Nobbie
  module Wx
    module Command

      describe "Reporter" do

        it "provides a reporter interface for use by executor" do
          Reporter.method_defined?(:before_executing_command).should be_true
          Reporter.method_defined?(:after_executing_command).should be_true
        end

      end

    end
  end
end
