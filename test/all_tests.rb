
require 'rubygems'
require_gem 'nobbie-wx'
require_all_in_directory [File.dirname(__FILE__), 'suite'].join(File::SEPARATOR)

APPLICATION_UNDER_TEST = TestApp.new
