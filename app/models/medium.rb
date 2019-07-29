class Medium < ApplicationRecord
  validates :title, :suggested_by, :media_type, presence: true

  enum media_type: { movie: 0, book: 1, show: 2, podcast: 3 }, _suffix: :category
end
