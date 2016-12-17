class GameRecommend < ActiveRecord::Base
  belongs_to :game
  belongs_to :recommend
end
