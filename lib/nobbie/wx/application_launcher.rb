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

      AUT_NOT_WX_APP = "APPLICATION_UNDER_TEST must be an instance of a Wx::App"
      AUT_NOT_DEFINED = "APPLICATION_UNDER_TEST must be set to be an instance of the application you wish to test"

      def initialize
        begin
          app = get_application
          unless app.is_a?(Wxruby2::App)
            handle(AUT_NOT_WX_APP)
          end
        rescue NameError => e
          handle(AUT_NOT_DEFINED)
        end
        @app = app
      end

      def with_application
        start
        result = yield
        stop
        result
      end

      def start
        puts "\n>> Starting application: #{@app.class}"
        start = Time.now

        @app_thread = Thread.new {
          @app.extend(ApplicationUnderTest)
          @app.init_timer
          @app.main_loop
        }

        @app_thread.priority = -1

        sleep 1
        finish = Time.now
        puts "\n>> Took #{finish-start} seconds to start application"
        Thread.pass
      end

      def stop
        puts "\n>> Stopping application: #{@app.class}\n"

        #todo: tbis would seem a polite way to exit .. but causes Bus/Segmentation Errors on OSX.
        #@app.top_window.destroy
        #@app.exit_main_loop
        #@app = nil
      end

      def handle(message)
        Kernel.raise message
      end

      def get_application
        APPLICATION_UNDER_TEST
      end
    end

  end
end
