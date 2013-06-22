class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :shelf_id

      t.timestamps
    end
  end
end
