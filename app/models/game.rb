class Game < ActiveRecord::Base
    belongs_to :hardware
    belongs_to :genre
    has_many :game_recommends
    has_many :recommends, through: :game_recommends
    paginates_per 18
    acts_as_taggable
end
