module Nobbie
  module Wx

    class ComponentNotFoundException < RuntimeError; end
    class ValueNotFoundException < RuntimeError; end
    class ComponentDisabledException < RuntimeError; end
    class UnsupportedOperationForComponentException < RuntimeError; end
    class ComponentReadOnlyException < RuntimeError; end

    class ElementPathBuilder

      def initialize(name)
        @name = name
      end

      # Finds the component specified in the path.  This implementation is about as dumb as its gets, but does
      # handle named components and menus.
      def find_component
        #todo: make me properly navigate component tree
        #todo: I should blow up if multiple windows with the same name are found ....

        #todo: shouldn't need to pass top_window here ... nil should search all
        component = Window.find_window_by_name(@name, TOP_WINDOW)
        return component unless component.nil?

        menu_bar = TOP_WINDOW.get_menu_bar
        unless menu_bar.nil?
          component = menu_bar.get_menu(menu_bar.find_menu(@name))
        end

        #todo: pull this up ...
        Kernel.raise(ComponentNotFoundException, "cannot find component with name: #{to_s}") if component.nil?

        component
      end

      def to_s
        "'#{@name}'"
      end
    end

  end
end
