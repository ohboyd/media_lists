class Movie < ApplicationRecord
  validates :title, :suggested_by, presence: true
end
