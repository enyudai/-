class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|

      t.timestamps
<<<<<<< HEAD
      
=======
>>>>>>> origin/develop
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
    end
  end
end
