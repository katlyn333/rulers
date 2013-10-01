require_relative 'test_helper'

class TestController < Rulers::Controller
  def index
    "success"
  end
end

class TestApp < Rulers::Application

end

class RouterTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_routing_calls_the_correct_controller_and_action
    get '/test/index'
    assert last_response.ok?
    assert last_response.header['Content-Type'] == "text/html"
    assert last_response.body == "success"
  end
end