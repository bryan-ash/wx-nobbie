
require 'nobbie/wx/command/reporter'

module Nobbie
  module Wx
    module Command

      class Executor #:nodoc:

        def initialize(reporter = Reporter.new)
          @reporter = reporter
        end

        def execute(command)
          @reporter.before_executing_command(command)
          result = command.execute
          @reporter.after_executing_command(result)
          result
        end

      end

    end
  end
end
