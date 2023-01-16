class CreateSubjectTags < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_tags do |t|
      
      t.references :subject, foreign_key: true
      t.references :tag, foreign_key: true
      
      t.timestamps
    end
    add_index :subject_tags, [:subject_id, :tag_id], unique: true
  end
end
