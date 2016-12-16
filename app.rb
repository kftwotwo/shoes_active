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
  @stores = Store.all
  erb(:new_shoe)
end

get('/stores/new') do
  @stores = Store.all
  erb(:new_store)
end

get('/stores/:id') do
  @store = Store.find(params["id"].to_i)
  @stores = Store.all
  @shoes = Shoe.all
  erb(:update_store)
end

patch('/stores/:id') do
  new_name = params["new-new-name"]
  new_brand = params["new-new-brand"]
  @stores = Store.find(params["id"].to_i)
  @stores.update({:name => new_name, :brand => new_brand})
  @stores = Store.all
  redirect '/stores'
end

delete('/stores/:id') do
  Store.find(params['id'].to_i).destroy
  redirect '/stores'
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
  new_year = params['year']
  new_kind = params['new-kind']
  @stores = Store.all
  @stores = Store.find(params['store_id'].to_i)
  @shoe = Shoe.create({:name => new_name, :brand => new_brand, :year => new_year, :kind => new_kind})
  @shoe.stores.push(@stores)
  if @shoe.save
    redirect '/shoes'
  else
    erb(:errors)
  end
end

get('/shoes/:id') do
  @shoes = Shoe.find(params["id"].to_i)
  @stores = @shoes.stores
  @allstores = Store.all
  erb(:update_shoe)
end

patch('/shoes/:id') do
  new_name = params["new-name"]
  new_brand = params["new-brand"]
  new_year = params["new-year"]
  new_kind = params["new-kind"]
  @shoe = Shoe.find(params["id"].to_i)
  @shoe.update({:name => new_name, :brand => new_brand, :year => new_year, :kind => new_kind})
  @shoe.stores.destroy_all
  @shoe.stores.push(Store.find(params["store_id"]))
  redirect '/shoes'
end

delete('/shoes/:id') do
  Shoe.find(params['id'].to_i).destroy
  redirect '/shoes'
end
