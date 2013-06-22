class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :supplier
      t.datetime :expected_date

      t.timestamps
    end
  end
end
