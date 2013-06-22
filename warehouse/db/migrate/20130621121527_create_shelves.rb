class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.integer :x
      t.integer :y
      t.integer :level

      t.timestamps
    end
  end
end
