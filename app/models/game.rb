class Game < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :genre
  has_one :game_detail, dependent: :destroy
  has_many :game_recommends, dependent: :destroy
  has_many :recommends, through: :game_recommends
  accepts_nested_attributes_for :game_detail
  paginates_per 18
  acts_as_taggable
end
