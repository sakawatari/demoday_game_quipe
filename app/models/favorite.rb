class Favorite < ActiveRecord::Base
  belongs_to :game, counter_cache: :favorites_count
  belongs_to :user
end
