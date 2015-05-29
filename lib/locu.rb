require 'locu/version'

module Locu
  def self.client
    @client ||= Locu::Client.new
  end
end