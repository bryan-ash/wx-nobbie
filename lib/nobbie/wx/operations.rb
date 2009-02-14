require 'nobbie/wx/platform'
require 'nobbie/wx/command_factory'
require 'nobbie/wx/application_launcher'

impl = File.dirname(__FILE__) + File::SEPARATOR + 'impl'
Dir.glob("#{impl}/**/*.rb") {|f| require "#{f}" }

module Nobbie
  module Wx

    module Operations

      # Types text into the component specified in the path.
      #  Supported components: TextCtrl, ComboBox
      def type(text, path)
        execute(command_factory.create_type_into_command(coerce_path(path), text))
      end

      # Clicks the component specified in the path.
      #  Supported components: Button
      def click(path)
        execute(command_factory.create_click_on_command(coerce_path(path)))
      end

      # Returns the component specified in the path.  Useful for performing operations that Nobbie does not
      # currently support.
      #  Supported components: Any
      def component(path)
        execute(command_factory.create_get_component_command(coerce_path(path)))
      end

      # Returns a SelectionOperations[link:classes/Nobbie/Wx/SelectOperations.html] for interacting with
      # the component specified in the path
      def selection(path)
        SelectOperations.new(self, coerce_path(path))
      end

      # Returns a ChoosableOperations[link:classes/Nobbie/Wx/ChoosableOperations.html] for interacting with
      # the component specified in the path
      def choosable(path)
        ChoosableOperations.new(self, coerce_path((path)))
      end

      # Determines if the component specified in the path is currently enabled.
      #  Supported components: Any
      def enabled?(path)
        execute(command_factory.create_is_enabled_command(coerce_path(path)))
      end

      # Creates an instance of the default {path builder}[link:classes/Nobbie/Wx/ElementPathBuilder.html].
      # Override this method if you wish to provide an alternative default path builder (because coerce_path
      # uses in_() internally).
      def in_(name)
        ElementPathBuilder.new(name)
      end

      # Creates an instance of the default {command factory}[link:classes/Nobbie/Wx/CommandFactory.html].
      # Override this method if you wish to provide an alternative command factory.
      def command_factory
        Command::Factory.new
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

      #todo: pull up
      def execute(command)
        command.execute
      end
    end

  end
end
