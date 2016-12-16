require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view all stylists or one', {:type => :feature}) do
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
end

# describe('add a client to a stylist', {:type => :feature}) do
#   it('allows a user to add a client to a stylist') do
#     @stylist.save()
#     visit("/stylists/#{@stylist.id()}")
#     fill_in("first_name", {:with => "John"})
#     fill_in("last_name", {:with => "twotwo"})
#     click_button('Add Client')
#     expect(page).to have_content("John twotwo")
#   end
# end
#
# describe('add a stylists', {:type => :feature}) do
#   it('allows the user to add a stylist in a list') do
#     visit('/stylists')
#     fill_in('first_name', :with => 'Table')
#     fill_in('last_name', :with => 'Chair')
#     click_button('Add Stylist')
#     expect(page).to have_content('Table Chair')
#   end
# end
#
# describe('update one stylist', {:type => :feature}) do
#   it('allows the user to update the name of a stylist or client') do
#     visit('/stylists')
#     fill_in('first_name', :with => 'sarina')
#     fill_in('last_name', :with => 'nus')
#     click_button('Add Stylist')
#     click_link('sarina nus')
#     click_link('Edit sarina nus')
#     fill_in('new_first_name', :with => 'Jerry')
#     fill_in('new_last_name', :with => 'Tom')
#     click_button('Update')
#     expect(page).to have_content('Jerry Tom')
#   end
# end
