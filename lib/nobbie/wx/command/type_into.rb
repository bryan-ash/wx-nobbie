module Nobbie
  module Wx
    module Command

      class TypeIntoCommand < ComponentAwareCommand #:nodoc:
        def initialize(path, value)
          super(path)
          @value = value
        end
        
        def execute
          highlight {
            if component.is_a?(TextCtrl) || component.is_a?(ComboBox)
              handle_text_ctrl_or_combo_box
            else
              handle_unsupported_operation_for_component
            end
          }
        end
        
        def describe
          "Type '#{@value}' into #{@path}"
        end
        
        private

        def handle_text_ctrl_or_combo_box
          ensure_enabled

          Kernel.raise(ComponentReadOnlyException, "cannot type, component is readonly") if readonly

          #todo: resolve issue with events when value does not change
          #this is required because windows raises the event when the value is the same, OSX does not.
          #return if component.value == @value

          #todo: consider using 'clear' .. but symantics different for ComboBox (ControlWithItems)
          type('')

          @value.length.times {|n| type(@value[0..n]) }
          nil
        end

        def readonly
          if component.is_a?(TextCtrl)
            return !component.is_editable 
          end
          
          if component.is_a?(ComboBox)
            return (component.get_window_style & CB_READONLY).nonzero?
          end
        end

        def type(text)
          #todo: this isnt quite right .. should really use append (but combo's don't support it)

          #todo: find a nicer way to handle OS specific bits ...
          if Platform.windows?
            event = CommandEvent.new(EVT_COMMAND_TEXT_UPDATED, component.get_id)
            event.string = text
            event.event_object = component

            #todo: should this use process_event
            component.command(event) if component.is_a?(ComboBox)
          end
          component.value = text
          component.refresh
          component.update
        end
      end

    end    
  end
end  