class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :withdrawal_flag, :boolean, default: false
  end
end
