class Memo < ApplicationRecord
  before_validation :set_default_title, on: :create
  validates :title, presence: true, uniqueness: true

  private

  def set_default_title
    self.title ||= Date.today.strftime("%Y-%m-%d")  # titleに今日の日付を設定
  end
end
