class RemoveSaleStatusFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :sale_status, :boolean
  end
end
