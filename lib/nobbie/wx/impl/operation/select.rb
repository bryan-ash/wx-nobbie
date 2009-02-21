module Nobbie
  module Wx

    class SelectOperations
      def initialize(operations, path)
        @operations = operations
        @path = path
      end

      # Retrieves the currently selected value for the component specified in the path.
      #  Supported components: Notebook, ComboBox, ListBox, Choice
      def selected_value
        execute(@operations.command_factory.create_get_selected_values_command(@path))
      end

      # Selects the given value for the component specified in the path.
      #  Supported components: Notebook, Menu, ComboBox, ListBox, Choice
      def choose(value)
        execute(@operations.command_factory.create_select_command(@path, value))
      end

      # Retrieves available options for the component specified in the path.
      #  Supported components: Notebook, ComboBox, ListBox, Choice
      def options
        execute(@operations.command_factory.create_get_options_command(@path))
      end
    end

  end
end
