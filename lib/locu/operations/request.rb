require 'httparty'

module Locu
  module Operations
    class Request

      def initialize(client)
        @client = client
      end

      def execute(req_url = nil, req_data = nil)
      end

    end
  end
end