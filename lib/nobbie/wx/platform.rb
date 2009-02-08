require 'rubygems'
require 'wx'

#todo: move this into Nobbie::Wx namespace ... once name clash is fixed
class Platform #:nodoc:
  include Wx

  WINDOWS = 'WXMSW'
  MAC = 'WXMAC'
  SUPPORTED_PLATFORMS = [WINDOWS, MAC]

  def self.windows?
    name == WINDOWS
  end

  def self.ensure_supported
    Kernel.raise "Sorry '#{name}' is not currently supported, Nobbie-Wx is only available for the following platforms: [#{SUPPORTED_PLATFORMS.join(',')}]" unless supported?
  end

  private

  def self.supported?
    SUPPORTED_PLATFORMS.include?(name)
  end

  def self.name
    Wx::PLATFORM
  end
end

Platform.ensure_supported
