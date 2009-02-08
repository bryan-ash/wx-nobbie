module Nobbie
  module Wx
    module Command

      class GetSelectedValuesCommand < ComponentAwareCommand #:nodoc:
        def execute
          if component.is_a?(Notebook)
            component.page(component.get_selection).name
          elsif component.is_a?(ComboBox)
            component.value
          elsif component.is_a?(ListBox) || component.is_a?(Choice)
            component.string_selection
          else
            handle_unsupported_operation_for_component
          end
        end
        
        def describe
          "Get selected values #{@path}"
        end
      end

    end    
  end
end  