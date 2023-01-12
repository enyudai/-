class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      #会員id
      t.integer :user_id
      #お題id
      t.integer :subject_id
      #答え
      t.string :answer, null: false
      
      t.timestamps
    end
  end
end
