class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :reception_status, null: false, default: 0
      t.integer :payment, null: false, default: 0
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :price, null: false
      
      t.timestamps
    end
  end
end
