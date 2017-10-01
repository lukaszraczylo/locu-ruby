require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'awesome_print'

describe 'user session' do
  it 'have credentials' do
    if ENV['CFG_LOCU_KEY'].empty?
      fail 'No ENV credentials specified.'
    end
  end

  it 'can list restaurants in London, United Kingdom' do
    client_request = CLIENT.send("search", "city", "London, United Kingdom")
    if client_request.is_a?(Hash)
      if client_request["status"] != "success" || client_request["venues"].empty?
        fail "Request returned failure or empty set of results. Double check given parameters."
      else
        expect(client_request["venues"].count).to eq(25)
        # client_request["venues"].count < 25 ? (fail "This test should return at least 25 venues") : false
      end
    else
      fail "Request should return JSON"
    end
  end

  it 'can list restaurants in WC2R 1LA, United Kingdom with no radius' do
    client_request = CLIENT.send("search", "postcode", "WC2R1LA, United Kingdom")
    if client_request.is_a?(Hash)
      if client_request["status"] != "success" || client_request["venues"].empty?
        fail "Request returned failure or empty set of results. Double check given parameters."
      else
        expect(client_request["venues"].count).to eq(25)
        # client_request["venues"].count < 25 ? (fail "This test should return at least 25 venues") : false
      end
    else
      fail "Request should return JSON"
    end
  end
end
