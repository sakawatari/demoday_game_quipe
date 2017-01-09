class Stock < ActiveRecord::Base
  belongs_to :game, counter_cache: :stocks_count
  belongs_to :user
end
