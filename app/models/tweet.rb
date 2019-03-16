class Tweet < ApplicationRecord
  belongs_to :user
  validates :title, length: { in: 1..255 }
  has_many :likes, dependent: :destroy
end
