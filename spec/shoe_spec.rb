require 'spec_helper'

describe(Shoe) do
  it "will check to see if the table is setup right" do
    shoe = Shoe.create({:name => 'idk', :brand => 'nike', :year => 2011, :kind => 'boots'})
  end

  it "will check to see the shoe is in many stores" do
    new_shoe = Shoe.create({:name => 'idk', :brand => 'Nike', :year => 2011, :kind => 'boots'})
    new_store = Store.create({:name => "Walmart", :brand => 'Nike'})
    new_store2 = Store.create({:name => "Nike", :brand => 'Nike'})
    new_store3 = Store.create({:name => "Nike Outlet", :brand => 'Nike'})
    expect(new_shoe.stores.push(new_store, new_store2, new_store3)).to(eq(new_shoe.stores))
    expect(Store.all).to eq [new_store, new_store2, new_store3]
  end
end
