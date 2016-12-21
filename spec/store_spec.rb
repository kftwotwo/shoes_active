require 'spec_helper'

describe(Store) do
  it "will check to see if the table is setup right store" do
    store = Store.create({:name => 'Shoe', :brand => 'Nike'})
    expect(Store.all).to eq [store]
  end

  it("ensures the length of description is at most 50 characters") do
    store = Store.new({:name => "a".*(16)})
    expect(store.save()).to(eq(false))
  end

  it("converts the name to titlecase") do
    store = Store.create({:name => "kevin is here"})
    expect(store.name()).to(eq("Kevin Is Here"))
  end
end
