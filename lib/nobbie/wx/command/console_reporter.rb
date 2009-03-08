
require 'nobbie/wx/command/reporter'

module Nobbie
  module Wx
    module Command

      class ConsoleReporter < Reporter #:nodoc:

        def initialize(output_stream = STDOUT)
          @output_stream = output_stream
        end

        def before_executing_command(command)
          @output_stream.puts "\n> #{command.describe}"
        end

        def after_executing_command(result)
          @output_stream.puts "< #{render(result)}"
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
