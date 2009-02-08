module Nobbie
  module Wx
    module Command  

      class ClickOnCommand < ComponentAwareCommand #:nodoc:
        def execute
          highlight {
            ensure_enabled

            if component.is_a?(Button)
              handle_button
            else
              handle_unsupported_operation_for_component
            end
          }
        end
        
        def describe
          "Click on #{@path}"
        end

        private

        def handle_button
          event = CommandEvent.new(EVT_COMMAND_BUTTON_CLICKED, component.get_id)
          event.event_object = component

          #todo: should this use process_event
          component.command(event)
        end
      end

    end
  end    
end
