module Nobbie
  module Wx
    module Command

      class GetOptionsCommand < ComponentAwareCommand #:nodoc:
        def execute
          if component.is_a?(Notebook)
            result = []
            component.page_count.times{|i| result << component.page_text(i)}
            result            
          elsif component.is_a?(ComboBox) || component.is_a?(ListBox) || component.is_a?(Choice)
            result = []
            component.count.times{|i| result << component.string(i)}
            result
          else
            handle_unsupported_operation_for_component
          end
        end

        def describe
          "Get options #{@path}"
        end
      end

    end
  end
end