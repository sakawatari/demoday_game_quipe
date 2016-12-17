class Recommend < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :game_recommends
  has_many :games, through: :game_recommends
  validates :title,
  presence: true,
  length: { maximum: 140 }
  validates :user_id, presence: true
end
