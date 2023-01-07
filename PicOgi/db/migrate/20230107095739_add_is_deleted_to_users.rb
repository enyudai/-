class AddIsDeletedToUsers < ActiveRecord::Migration[6.1]
  ##デフォルト値(false)を設定し、登録した直後は false が設定
  
  def change
    add_column :users, :is_deleted, :boolean, default: false
  end
end
