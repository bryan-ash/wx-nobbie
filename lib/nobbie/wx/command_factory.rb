require 'nobbie/wx/command'

command = File.dirname(__FILE__) + File::SEPARATOR + 'command'
Dir.glob("#{command}/**/*.rb") {|f| require "#{f}" }

require 'nobbie/wx/command/console_executor'

module Nobbie
  module Wx
    module Command

      class Factory
        def create_type_into_command(path, value)
          TypeIntoCommand.new(path, value)
        end

        def create_get_component_command(path)
          GetComponentCommand.new(path)
        end

        def create_click_on_command(path)
          ClickOnCommand.new(path)
        end

        def create_get_selected_values_command(path)
          GetSelectedValuesCommand.new(path)
        end

        def create_select_command(path, value)
          SelectCommand.new(path, value)
        end

        def create_is_chosen_command(path)
          IsChosenCommand.new(path)
        end

        def create_choose_command(path)
          ChooseCommand.new(path)
        end

        def create_is_enabled_command(path)
          IsEnabledCommand.new(path)
        end

        def create_get_options_command(path)
          GetOptionsCommand.new(path)
        end
      end

    end
  end
end
