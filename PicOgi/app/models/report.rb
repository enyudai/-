class Report < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  # belongs_to :answer
  
  # 通報ステータス waiting →対応待ち finish →対応済み
  enum report_status: { waiting: 0, finish: 1 }
  
end
