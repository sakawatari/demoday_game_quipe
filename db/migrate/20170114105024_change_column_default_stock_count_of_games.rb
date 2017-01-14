class ChangeColumnDefaultStockCountOfGames < ActiveRecord::Migration
  def up
    change_column :games, :stocks_count, :integer, default: 0
  end
  def down
    change_column :games, :stocks_count, :integer
  end
end
