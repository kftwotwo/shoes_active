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
    @store.save
    visit('/shoes/new')
    fill_in('new-name', :with => 'Air Flow 2.0')
    fill_in('new-brand', :with => 'Nike')
    fill_in('new-year', :with => '2001')
    fill_in('new-kind', :with => 'Normal')
    select("Nike Outlet", :from => 'store_id')
    click_button('Enter')
    visit('/shoes')
    click_link('Air Flow 2.0')
    fill_in('new-name', :with => 'Something')
    fill_in('new-brand', :with => 'Something')
    fill_in('new-year', :with => '2016')
    fill_in('new-kind', :with => 'Something')
    select("Nike Outlet", :from => 'store_id')
    click_button('Update')
    expect(page).to have_content('Something')
  end

  it "able to update a store" do
    visit('/stores/new')
    fill_in('new-name', :with => 'Kevins Spot')
    fill_in('new-brand', :with => 'Nike')
    click_button('Enter')
    visit('/stores')
    click_link('Kevins Spot')
    fill_in('new-new-name', :with => 'Something')
    fill_in('new-new-brand', :with => 'Something')
    click_button('Update')
    expect(page).to have_content('Something')
  end

  it "able to Delete a store" do
    visit('/stores/new')
    fill_in('new-name', :with => 'Kevins Spot')
    fill_in('new-brand', :with => 'Nike')
    click_button('Enter')
    visit('/stores')
    click_link('Kevins Spot')
    fill_in('new-new-name', :with => 'Something')
    fill_in('new-new-brand', :with => 'Something')
    click_button('Delete')
    expect(page).to have_content()
  end
end
