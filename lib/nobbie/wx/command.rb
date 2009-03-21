module Nobbie
  module Wx
    module Command

      class ComponentAwareCommand  #:nodoc:
        def initialize(path)
          @path = coerce_path(path)
        end

        def component
          @component ||= @path.find_component
        end

        def handle_unsupported_operation_for_component
          Kernel.raise(UnsupportedOperationForComponentException,
            "cannot: #{describe} because component #{component.class} does not support it")
        end

        def handle_value_not_found
          Kernel.raise(ValueNotFoundException,
            "cannot: #{describe} because value #{@value} not found")
        end

        def ensure_enabled(id = nil)
          #is_enabled takes an id for menu's
          enabled = id.nil? ? component.is_enabled : component.is_enabled(id)

          Kernel.raise(ComponentDisabledException,
            "cannot: #{describe} because component is disabled") unless enabled
        end

        def highlight(component = component)
          Kernel.raise "highlight requires a block" unless block_given?

          begin
            unless [Menu, Panel].include?(component.class)
              original_colour = component.background_colour
              component.background_colour = Colour.from_hex('#FFFF00')
              component.update
            end
            result = yield component
            unless component.is_a?(Menu)
              component.update
            end
            return result
          ensure
            unless [Menu, Panel].include?(component.class)
              component.background_colour = original_colour
              component.refresh
            end
          end
        end

        private

        def coerce_path(path)
          return path if path.respond_to?(:find_component)

          if path.is_a?(Hash) && path.has_key?(:in)
            return path[:in].is_a?(String) ? in_(path[:in]) : path[:in]
          end

          return in_(path.id2name) if path.is_a?(Symbol)
          return in_(path) if path.is_a?(String)

          Kernel.raise("Unable to coerce path: #{path}")
        end

      end
    end
  end
end
