class Report < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  # belongs_to :answer
  
  # 通報ステータス waiting →対応待ち keep →保留 finish →対応済み
  enum report_status: { waiting: 0, keep: 1, finish: 3 }
  
end
