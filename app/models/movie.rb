class Medium < ApplicationRecord
  validates :title, :suggested_by, presence: true
end
