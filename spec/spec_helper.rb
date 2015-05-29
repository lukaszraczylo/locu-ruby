$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'locu'
require 'rspec'

RSpec.configure do |c|
  c.fail_fast = true
end

CLIENT = Locu::Client.new({ app_user_key: ENV['CFG_LOCU_KEY'], api_host: 'https://api.locu.com/v2/'})