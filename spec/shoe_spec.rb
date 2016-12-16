require 'spec_helper'

describe(Shoe) do
  it "will check to see if the table is setup right" do
    shoe = Shoe.create({:name => 'idk', :brand => 'nike', :year => 2011, :kind => 'boots'})
  end
end
