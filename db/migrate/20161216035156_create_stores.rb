class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:brand, :string)
    end
  end
end
