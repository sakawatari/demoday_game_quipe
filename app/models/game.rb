class Game < ActiveRecord::Base
    belongs_to :hardware
    belongs_to :genre
    paginates_per 18
end
