require 'httparty'

module Locu
  module Operations
    class Request
      def initialize(client)
        @client = client
      end

      def execute(req_url = nil, req_data = nil)
        req_data["api_key"] = @client.configuration.app_user_key
        obj = HTTParty.post("#{@client.configuration.api_host}#{req_url.to_s}", :body => req_data.to_json).body
        JSON.parse(obj)
      end
    end
  end
end
