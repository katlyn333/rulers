require_relative 'test_helper'

class TestApp < Rulers::Application

end

class RulerAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def exception_handling_results_in_a_500
    get "/unknown_route"
    assert last_response.status == 500
    assert last_response.body =~ %r{500 Server Error}
  end

  def test_request
    get "/"
    assert last_response.status == 404
    assert last_response.body["Missing"]
  end

  def test_missing_favicon
    get "/favicon.ico"
    assert last_response.status == 404
  end
end