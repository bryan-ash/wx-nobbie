module Nobbie
  module Wx
    module Command

      class SelectCommand < ComponentAwareCommand #:nodoc:
        def initialize(path, value)
          super(path)
          @value = value
        end

        def execute
          if component.is_a?(Menu)
            return handle_menu
          end

          ensure_enabled

          if component.is_a?(Notebook)
            handle_notebook
          elsif component.is_a?(ComboBox)
            handle_combo_box
          elsif component.is_a?(ListBox) || component.is_a?(Choice)
            handle_list_box_or_choice
          else
            handle_unsupported_operation_for_component
          end
          nil
        end

        def describe
          "Select '#{@value}' in #{@path}"
        end

        private

        def handle_menu
          id = component.find_item(@value)
          handle_value_not_found unless id > -1
          ensure_enabled(id)

          #todo: should this be a MenuEvent?
          TOP_WINDOW.process_event(CommandEvent.new(EVT_COMMAND_MENU_SELECTED, id))

          return ''
        end

        def handle_notebook
          component.page_count.times {|i|
            if component.page(i).name == @value
              highlight(component.page(i)) {
                component.selection = i
              }
              return ''
            end
          }

          handle_value_not_found
        end

        #todo: remove duplication for event raising
        def handle_combo_box
          highlight {
            index = component.find_string(@value)
            handle_value_not_found unless index > -1

            event = CommandEvent.new(EVT_COMMAND_COMBOBOX_SELECTED, component.get_id)
            component.selection = index
            event.event_object = component

            #todo: should this use process_event
            component.command(event)
          }
        end

        #todo: remove duplication for event raising
        def handle_list_box_or_choice
          highlight {
            index = component.find_string(@value)
            handle_value_not_found unless index > -1

            event_type = (component.is_a?(ListBox) ? EVT_COMMAND_LISTBOX_SELECTED : EVT_COMMAND_CHOICE_SELECTED)

            event = CommandEvent.new(event_type, component.get_id)
            event.int = 1 #no idea why this works .. but it is needed
            event.string = @value
            component.selection = index
            event.event_object = component

            component.process_event(event)
          }
        end
      end

    end
  end
end
