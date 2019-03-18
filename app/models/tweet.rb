class Tweet < ApplicationRecord
  belongs_to :user
  validates :title, length: { in: 1..255 }
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
