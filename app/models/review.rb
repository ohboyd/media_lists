class Review < ApplicationRecord
  belongs_to :medium

  has_rich_text :comment

  validates :comment, presence: true

  STARS = [1, 2, 3, 4, 5]
  validates :stars, inclusion: { in: STARS, message: 'Must be between 1 and 5' }

  scope :picks, -> { where(pick: true) }
  scope :last_month, -> { where(created_at: Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month) }

  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
