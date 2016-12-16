require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Add, Assign, update', {:type => :feature}) do
  before :each do
    @store = Store.new({:name => 'Nike Outlet', :brand => 'Nike'})
    @store2 = Store.new({:name => 'Walmart', :brand => 'Everything'})

    @shoe = Shoe.new({:name => 'Air Flow 2.0', :brand => 'Nike', :year => '2000', :kind => 'Boots'})
    @shoe2 = Shoe.new({:name => 'Super Light', :brand => 'Adidas', :year => '2016', :kind => 'Gym Shoes'})
  end
  it('allows a you to see the shoe') do
    @shoe.save()
    visit('/shoes')
    expect(page).to have_content('Air Flow 2.0')
  end
  it('allows a you to see the shoe') do
    @store.save()
    visit('/stores')
    expect(page).to have_content('Nike Outlet')
  end

  it "able to assign a shoe to a store" do
    @store.save
    @store2.save
    visit('/shoes/new')
    fill_in('new-name', :with => 'Air Flow 2.0')
    fill_in('new-brand', :with => 'Nike')
    fill_in('new-year', :with => '2001')
    fill_in('new-kind', :with => 'Normal')
    select("Nike Outlet", :from => 'store_id')
    click_button('Enter')
    expect(page).to have_content('Air Flow 2.0')
  end

  it "able to update a shoe" do
    visit('/shoes/new')
    fill_in('new-name', :with => 'Air Flow 2.0')
    fill_in('new-brand', :with => 'Nike')
    fill_in('new-year', :with => '2001')
    fill_in('new-kind', :with => 'Normal')
    select("Nike Outlet", :from => 'store_id')
    click_button('Enter')
    expect(page).to have_content('Air Flow 2.0')
  end

  it "able to update a store" do
    @store.save
    @store2.save
    visit('/shoes/new')
    fill_in('new-name', :with => 'Air Flow 2.0')
    fill_in('new-brand', :with => 'Nike')
    fill_in('new-year', :with => '2001')
    fill_in('new-kind', :with => 'Normal')
    select("Nike Outlet", :from => 'store_id')
    click_button('Enter')
    expect(page).to have_content('Air Flow 2.0')
  end
end
