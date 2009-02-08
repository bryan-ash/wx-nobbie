module Nobbie
  module Wx
    module Command

      class ChooseCommand < ComponentAwareCommand #:nodoc:
        def execute
          highlight {
            ensure_enabled
            
            if component.is_a?(RadioButton) || component.is_a?(CheckBox)
              handle_radio_button_or_check_box
            else
              handle_unsupported_operation_for_component
            end
          }
        end
      
        def describe
          "Choose #{@path}"
        end

        private

        def handle_radio_button_or_check_box
          event_type = (component.is_a?(RadioButton) ? EVT_COMMAND_RADIOBUTTON_SELECTED : EVT_COMMAND_CHECKBOX_CLICKED)

          event = CommandEvent.new(event_type, component.get_id)
          event.int = 1 #no idea why this works .. but it is needed
          event.event_object = component

          #todo: should this use process_event
          component.command(event)
        end
      end

    end    
  end
end  