module Nobbie
  module Wx
    module Command  

      class IsChosenCommand < ComponentAwareCommand #:nodoc:
        def execute
          if component.is_a?(RadioButton) || component.is_a?(CheckBox) 
            return component.value
          else
            handle_unsupported_operation_for_component
          end
        end
      
        def describe
          "Is chosen #{@path}"
        end
      end

    end    
  end
end  