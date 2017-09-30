require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'awesome_print'

describe 'user session' do
  it 'have credentials' do
    if ENV['CFG_LOCU_KEY'].empty?
      fail 'No ENV credentials specified.'
    end
  end

  it 'can list restaurants in London, Great Britain' do
    params = ["city", "London, Great Britain"]
    client_request = CLIENT.send("search", params)
    if client_request.is_a?(Hash)
      if client_request["status"] != "success" || client_request["venues"].empty?
        fail "Request returned failure or empty set of results. Double check given parameters."
      else
        client_request["venues"].count < 25 ? (fail "This test should return at least 25 venues") : false
      end
    else
      fail "Request should return JSON"
    end
  end
end
