require 'rubygems'
require 'wx'

module Nobbie

  module Wx
    
    class Platform #:nodoc:

      include Wx
      
      WINDOWS = 'WXMSW'
      MAC = 'WXMAC'
      SUPPORTED_PLATFORMS = [WINDOWS, MAC]

      def self.windows?
        name == WINDOWS
      end
      
      def self.ensure_supported
        raise unsupported_message unless supported?
      end
      
      private
      
      def self.supported?
        SUPPORTED_PLATFORMS.include?(name)
      end
      
      def self.unsupported_message
        "Sorry '#{name}' is not currently supported, " +
          "Nobbie-Wx is only available for the following platforms: " +
          "[#{SUPPORTED_PLATFORMS.join(',')}]"
      end
      
      def self.name
        Wxruby2::PLATFORM
      end
      
    end
    
  end
  
end

Nobbie::Wx::Platform.ensure_supported
