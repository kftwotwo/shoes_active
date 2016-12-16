ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/activerecord')
require('./lib/shoe')
require('./lib/store')

RSpec.configure do |config|
  config.before(:each) do

    Shoe.destroy_all

    Store.destroy_all
  end
end
