require File.join(File.dirname(__FILE__), 'spec_helper')
require 'nobbie/wx/command/executor'

module Nobbie
  module Wx
    module Command

      describe "Executor" do

        before :each do
          @command = mock("command")
        end

        describe "basic execution" do

          it "executes a command" do
            @command.should_receive(:execute)

            Nobbie::Wx::Command::Executor.execute(@command)
          end

          it "calls 'before' and 'after' hooks" do
            reporter = mock('SilentReporter')
            Reporter.should_receive(:new).and_return(reporter)
            reporter.should_receive(:before_executing_command)
            reporter.should_receive(:after_executing_command)

            @command.should_receive(:execute)

            executor = Nobbie::Wx::Command::Executor.new

            executor.execute(@command)
          end

          it "calls 'before' and 'after' hooks on supplied Reporter" do
            reporter = mock('Reporter')
            reporter.should_receive(:before_executing_command)
            reporter.should_receive(:after_executing_command)

            @command.should_receive(:execute)

            Nobbie::Wx::Command::Executor.reporter = reporter
            Nobbie::Wx::Command::Executor.execute(@command)
          end

        end

      end
    end
  end
end
