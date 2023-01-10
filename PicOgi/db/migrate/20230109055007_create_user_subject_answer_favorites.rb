class CreateUserSubjectAnswerFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :user_subject_answer_favorites do |t|
      #会員id
      t.integer :user_id
      #回答id
      t.integer :user_subject_answer_id
      
      t.timestamps
    end
  end
end
