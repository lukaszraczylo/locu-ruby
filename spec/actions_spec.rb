require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'user session' do
  it 'have credentials' do
    if ENV['CFG_LOCU_KEY'].empty?
      fail 'No ENV credentials specified.'
    end
  end
end