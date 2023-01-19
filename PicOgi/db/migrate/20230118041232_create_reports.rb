class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      
      #会員id
      t.integer :user_id, null: false
      #お題id
      t.integer :subject_id
      #回答id
      # t.integer :answer_id
      #管理者が通報に対して「対応済み」等、ステータスを変えられるようにする。
      t.integer :report_status, default: 0, null: false
      #通報理由
      t.text :reason
      
      t.timestamps
    end
  end
end
