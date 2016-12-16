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

post('/stores/new') do
  new_name = params['new-name']
  new_brand = params['new-brand']
  @store = Store.create({:name => new_name, :brand => new_brand})
  if @store.save
    redirect '/stores'
  else
    erb(:errors)
  end
end

post('/shoes/new') do
  new_name = params['new-name']
  new_brand = params['new-brand']
  new_year = params['year'].to_s
  new_kind = params['new-kind']
  @shoe = Shoe.create({:name => new_name, :brand => new_brand, :year => new_year, :kind => new_kind})
  if @shoe.save
    redirect '/shoes'
  else
    erb(:errors)
  end
end
