require "rulers/version"

module Rulers
  class Application 
    def call(env)
	    [200, {'Content-Type' => "text/html"}, ["<b>Hello from Ruby on Rulers!"]]
    end
  end
end
