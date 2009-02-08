module Nobbie
  module Wx
    module Command  

      class Executor #:nodoc:
        def execute(command)
          puts "\n> #{command.describe}"
          result = command.execute
          puts "< #{render(result)}"
          result
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