class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoes) do |t|
      t.column(:name, :string)
      t.column(:brand, :string)
      t.column(:year, :integer)
      t.column(:kind, :string)
    end
  end
end
