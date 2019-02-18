class List < ApplicationRecord
  belongs_to :user
  validate :title, length: { in: 1..255}
end
