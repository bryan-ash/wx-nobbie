
require 'nobbie/wx/command/reporter'

module Nobbie
  module Wx
    module Command

      class Executor #:nodoc:

        def self.execute(command)
          executor.execute(command)
        end

        def self.executor
          @executor ||= new
        end

        def self.reporter= reporter
          executor.reporter = reporter
        end
        
        def initialize(reporter = Reporter.new)
          @reporter = reporter
        end

        def execute(command)
          @reporter.before_executing_command(command)
          result = command.execute
          @reporter.after_executing_command(result)
          result
        end

        def reporter= reporter
          @reporter = reporter
        end

      end

    end
  end
end
