class Game < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :genre
  belongs_to :user
  has_many :stocks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :game_detail, dependent: :destroy
  has_many :game_recommends, dependent: :destroy
  has_many :recommends, through: :game_recommends
  accepts_nested_attributes_for :game_detail
  paginates_per 18
  acts_as_taggable
  def stock_user(user_id)
    stocks.find_by(user_id: user_id)
  end
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
