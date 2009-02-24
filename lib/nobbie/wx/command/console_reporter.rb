
require 'nobbie/wx/command/reporter'

module Nobbie
  module Wx
    module Command

      class ConsoleReporter < Reporter #:nodoc:

        def before_executing_command(command)
          STDOUT.puts "\n> #{command.describe}"
        end

        def after_executing_command(result)
          STDOUT.puts "< #{render(result)}"
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
