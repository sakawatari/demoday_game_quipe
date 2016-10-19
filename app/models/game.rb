class Game < ActiveRecord::Base
    belongs_to :hardware
    belongs_to :genre
    paginates_per 18
    acts_as_taggable
end
