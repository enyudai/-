class CreateGoodMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :good_marks do |t|

      t.timestamps
    end
  end
end
