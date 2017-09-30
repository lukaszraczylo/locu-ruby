module Locu
  module Operations
    class Venue
      def initialize(client)
        @client = client
        @request = Locu::Operations::Request.new(@client)
      end

      # Searching for venues using specified attributes
      def search(type = "address", location = "The Strand", menu = true, **other )#, kind = "restaurant", menu = true, menu_item = nil)
        query_frame = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
        query_frame["fields"] = ["name", "menus"]

        query_frame["venue_queries"] = Array.new
        query_body = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }

        type == "city" ? ( query_body["location"]["locality"] = location.split(", ")[0]; query_body["location"]["country"] = location.split(", ")[1]) : false
        type == "geo" ? query_body["location"]["geo"] = location : false

        query_body["menus"]["$present"] = menu

        if other.has_key?(:menu_item)
          query_frame["menu_item_queries"] = Array.new
          query_menu_key = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
          query_menu_key["name"] = other[:menu_item]
          query_frame["menu_item_queries"].push(query_menu_key)
        end

        query_frame["venue_queries"].push(query_body)

        ap query_frame.to_json
        @request.execute('/venue/search', query_frame)
      end
    end
  end
end
