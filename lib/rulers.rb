require "rulers/version"
require "rulers/routing"

module Rulers
  class Application 
    def call(env)
      # TODO fix this hack for routing favicon image
      if(env["PATH_INFO"] == "/favicon.ico")
        return [404, {'Content-Type' => "text/html"}, []]
      end

      begin
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, {'Content-Type' => "text/html"}, [text]]
      rescue => e
        error_body = "<h1>500 Server Error</h1> <p>#{e.message}</p><h2>Backtrace</h2>#{e.backtrace}"
        [500, {'Content-Type' => "text/html"}, [error_body]]
      end
    end
  end

  class Controller
    def initialize(env)
        @env = env
    end

    def env
      @env
    end
  end
end
