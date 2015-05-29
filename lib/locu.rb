require 'locu/version'
require 'locu/client'

module Locu
  def self.client
    @client ||= Locu::Client.new
  end
end