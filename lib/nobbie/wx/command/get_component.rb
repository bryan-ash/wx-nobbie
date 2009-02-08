module Nobbie
  module Wx
    module Command

      class GetComponentCommand < ComponentAwareCommand #:nodoc:
        def execute
          component
        end
        
        def describe
          "Get component #{@path}"
        end
      end

    end    
  end
end  