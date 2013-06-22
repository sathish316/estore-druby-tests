class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :price
      t.integer :purchase_order_id

      t.timestamps
    end
  end
end
