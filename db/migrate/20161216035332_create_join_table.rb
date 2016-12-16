class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoes_stores) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
