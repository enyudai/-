class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      #会員id
      t.integer :user_id
      #タイトル
      t.string :title, null: false
      #お題
      t.string :theme, null: false
      #期限
      t.string :time_limit, null: false
      t.boolean :status, default: false, null: false
      
      t.timestamps
    end
  end
end
