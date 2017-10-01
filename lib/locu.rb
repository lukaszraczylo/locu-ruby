require_relative 'locu/version'
require_relative 'locu/client'

module Locu
  def self.client
    @client ||= Locu::Client.new
  end
end
