require 'spec_helper'

describe(Store) do
  it "will check to see if the table is setup right store" do
    store = Store.create({:name => 'Shoe', :brand => 'Nike'})
    expect(Store.all).to eq [store]
  end
end
