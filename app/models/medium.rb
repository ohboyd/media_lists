class Medium < ApplicationRecord
  has_one :review, dependent: :destroy
  has_rich_text :suggestion_reason

  validates :title, :suggested_by, :media_type, presence: true

  enum media_type: { movie: 0, book: 1, show: 2, podcast: 3, music: 4 }, _suffix: :category

  scope :reviewed, -> { where(reviewed: true) }
  scope :unreviewed, -> { where(reviewed: false) }
end
