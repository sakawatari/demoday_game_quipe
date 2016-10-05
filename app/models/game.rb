class Game < ActiveRecord::Base
    belongs_to :hardware
    belongs_to :genre
end
