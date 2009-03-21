require 'nobbie/wx/command_factory'

require "nobbie/wx/impl/element/element_path_builder"

module Nobbie
  module Wx

    module Operations

      # Types text into the component specified in the path.
      #  Supported components: TextCtrl, ComboBox
      def type(text, path)
        execute(command_factory.create_type_into_command(path, text))
      end

      # Returns the text in the component specified in the path.
      #  Supported components: TextCtrl, ComboBox
      def text(path)
        component = component(path)
        component.nil? ? nil : component.value
      end

      # Clicks the component specified in the path.
      #  Supported components: Button
      def click(path)
        execute(command_factory.create_click_on_command(path))
      end

      # Returns the component specified in the path.  Useful for performing operations that Nobbie does not
      # currently support.
      #  Supported components: Any
      def component(path)
        execute(command_factory.create_get_component_command(path))
      end

      # Selects the given value for the component specified in the path.
      #  Supported components: Notebook, Menu, ComboBox, ListBox, Choice
      def select(value, path)
        execute(command_factory.create_select_command(path, value))
      end

      # Retrieves the currently selected value for the component specified in the path.
      #  Supported components: Notebook, ComboBox, ListBox, Choice
      def selected_value(path)
        execute(command_factory.create_get_selected_values_command(path))
      end

      # Retrieves available options for the component specified in the path.
      #  Supported components: Notebook, ComboBox, ListBox, Choice
      def options(path)
        execute(command_factory.create_get_options_command(path))
      end

      # Chooses the component specified in the path.
      #  Supported components: RadioButton, CheckBox
      def choose(path)
        execute(command_factory.create_choose_command(path))
      end

      # Determines if the component specified in the path is chosen.
      #  Supported components: RadioButton, CheckBox
      def chosen?(path)
        execute(command_factory.create_is_chosen_command(path))
      end

      # Determines if the component specified in the path is currently enabled.
      #  Supported components: Any
      def enabled?(path)
        execute(command_factory.create_is_enabled_command(path))
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

      def execute(command)
        Command::Executor.execute(command)
      end

    end

  end
end
