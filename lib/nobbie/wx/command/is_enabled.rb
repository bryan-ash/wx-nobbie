module Nobbie
  module Wx
    module Command

      class IsEnabledCommand < ComponentAwareCommand #:nodoc:
        def execute
          #todo: are there any components that do not respond to is_enabled? 
          component.is_enabled
        end
      
        def describe
          "Is enabled #{@path}"
        end
      end

    end    
  end
end  