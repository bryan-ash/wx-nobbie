module Nobbie
  module Wx
    module Command

      class Executor #:nodoc:

        def initialize
          @before = nil
          @after = nil
        end

        def register_before_command_proc(&proc)
          @before = proc
        end

        def register_after_command_proc(&proc)
          @after = proc
        end

        def execute(command)
          @before.call(command) unless @before.nil?
          result = command.execute
          @after.call(result) unless @after.nil?
          result
        end

      end

    end
  end
end
