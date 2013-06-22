class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :price
      t.integer :order_id

      t.timestamps
    end
  end
end
