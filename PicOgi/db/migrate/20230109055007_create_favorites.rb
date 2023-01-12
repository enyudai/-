class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      #会員id
      t.integer :user_id
      #回答id
      t.integer :answer_id
      
      t.timestamps
    end
  end
end
