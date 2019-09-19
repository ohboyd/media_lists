class Review < ApplicationRecord
  belongs_to :medium

  has_rich_text :comment

  validates :comment, presence: true

  STARS = [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
  validates :stars, inclusion: { in: STARS, message: 'Must be between 1 and 5' }

  scope :picks, -> { where(pick: true) }

  #TODO: remove this scope, if I'm not reviewing enough movies to justify setting the review index to the month prior
  scope :last_month, -> { where(created_at: Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month) }

  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
