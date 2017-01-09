class AddStocksCountToGames < ActiveRecord::Migration
  def change
    add_column :games, :stocks_count, :integer
  end
end
