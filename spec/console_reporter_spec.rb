require File.join(File.dirname(__FILE__), 'spec_helper')
require 'nobbie/wx'
require 'nobbie/wx/command/console_reporter'

module Nobbie
  module Wx
    module Command

      describe "ConsoleReporter" do

        it "behave like a Reporter" do
          ConsoleReporter.new.should be_kind_of(Reporter)
        end

        describe "outputs" do

          before :each do
            @command = mock('command')
            @command.should_receive(:describe).and_return('description')
            @command.should_receive(:execute).and_return('result')
          end
          
          it "to STDOUT by default" do
            STDOUT.should_receive(:puts).with(/description/)
            STDOUT.should_receive(:puts).with(/result/)
            
            reporter = ConsoleReporter.new
            executor = Executor.new(reporter)
            executor.execute(@command)
          end

          it "to a specified IO stream" do
            @io = StringIO.new
            
            @io.should_receive(:puts).with(/description/)
            @io.should_receive(:puts).with(/result/)
            
            reporter = ConsoleReporter.new(@io)
            executor = Executor.new(reporter)
            executor.execute(@command)
          end        

        end
        
      end

    end
  end
end
