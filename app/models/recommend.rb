class Recommend < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :game_recommends
  has_many :games, through: :game_recommends
  accepts_nested_attributes_for :game_recommends, allow_destroy: true
  validates :title,
  presence: true,
  length: { maximum: 140 }
  validates :user_id, presence: true
end
