class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      #会員id
      t.integer :user_id, null: false
      #タイトル
      t.string :title, null: false
      #お題
      t.string :theme, null: false
      #期限
      t.string :time_limit, null: false
      
      t.timestamps
    end
  end
end
