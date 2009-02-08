module Nobbie
  module Wx

    class ChoosableOperations
      def initialize(operations, path)
        @operations = operations
        @path = path    
      end

      # Chooses the component specified in the path.
      #  Supported components: RadioButton, CheckBox
      def choose
        execute(@operations.command_factory.create_choose_command(@path))
      end

      # Determines if the component specified in the path is chosen.
      #  Supported components: RadioButton, CheckBox
      def chosen?
        execute(@operations.command_factory.create_is_chosen_command(@path))
      end

      private

      #todo: pullup execute
      def execute(command)
        Command::Executor.new.execute(command)
      end
    end

  end
end  