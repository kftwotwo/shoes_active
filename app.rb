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

get('/shoes/new') do
  @shoes = Shoe.all
  erb(:new_shoe)
end

get('/stores/new') do
  @stores = Store.all
  erb(:new_store)
end
