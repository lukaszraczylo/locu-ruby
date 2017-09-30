require 'httparty'

module Locu
  module Operations
    class Request
      def initialize(client)
        @client = client
      end

      def execute(req_url = nil, req_data = nil)
        base_url = 'https://api.locu.com/v2/'
        req_data["api_key"] = @client.configuration.app_user_key
        obj = HTTParty.post("#{base_url}#{req_url.to_s}", :body => req_data.to_json).body
        JSON.parse(obj)
      end
    end
  end
end
