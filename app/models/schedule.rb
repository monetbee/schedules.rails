class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_at, presence: true
  validates :end_at,   presence: true
  validate  :end_after_start

  # 終日のときは日付だけに正規化（任意：付けると便利）
  before_validation :normalize_all_day_times

  private

  def end_after_start
    return if start_at.blank? || end_at.blank?
    if end_at < start_at
      errors.add(:end_at, 'は開始日時以降にしてください')
    end
  end

  def normalize_all_day_times
    return unless all_day
    self.start_at = start_at&.to_date&.beginning_of_day
    self.end_at   = end_at&.to_date&.end_of_day
  end
end
