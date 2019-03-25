class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists, dependent: :destroy
  has_many :tweets, dependent: :destroy
  # has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
end
