module Nobbie
  module Wx
    module Command

      class ConsoleReporter #:nodoc:

        def initialize
          EXECUTOR.register_before_command_proc do |command|
            puts "\n> #{command.describe}"
          end

          EXECUTOR.register_after_command_proc do |result|
            puts "< #{render(result)}"
          end
        end

        private

        def render(component)
          #todo: this needs improving to support other components
          return '' if component.nil?
          return component.value if component.respond_to?(:get_value)
          return component.inspect
        end
      end

    end
  end
end
