require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/shoe')
require('./lib/store')

get('/') do
  erb(:index)
end

get('/shoes') do
  @shoes = Shoe.all
  erb(:shoes)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end
