
require 'rubygems'
require 'wx'

module Nobbie
  module Wx

    module ApplicationUnderTest #:nodoc:
      def init_timer
        @aut_timer = Timer.new(self, -1)
        @aut_timer.start(10)
        evt_timer(@aut_timer.object_id) {|e| self.yield; Thread.pass }
      end

      #todo: think about adding evt_idle here as well.
    end

    class ApplicationLauncher #:nodoc:

      AUT_NOT_WX_APP = "application_under_test must be an instance of a Wx::App"

      def initialize(application_under_test)
        @app = application_under_test
        Kernel.raise(AUT_NOT_WX_APP) unless @app.is_a?(Wxruby2::App)
      end

      def run
        start
        set_top_window_for_use_in_operations
        Thread.pass
        stop
      end

      private

      def start
        start = Time.now

        @app_thread = Thread.new {
          @app.extend(ApplicationUnderTest)
          @app.init_timer
          @app.main_loop
        }

        @app_thread.priority = -1

        sleep 1
        Thread.pass
      end

      def stop
        #todo: this would seem a polite way to exit .. but causes Bus/Segmentation Errors on OSX.
        #@app.top_window.destroy
        #@app.exit_main_loop
        #@app = nil
      end

      def set_top_window_for_use_in_operations
        Nobbie::Wx::Operations.const_set("TOP_WINDOW",  @app.get_top_window)
      end

    end

  end
end
