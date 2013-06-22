class CreateDeliveryItems < ActiveRecord::Migration
  def change
    create_table :delivery_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :shipping_address

      t.timestamps
    end
  end
end
