class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :billing_address, :string
    add_column :users, :shipping_address, :string
  end
end
