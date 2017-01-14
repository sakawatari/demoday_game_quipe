class ChangeColumnDefaultFavoriteCountOfGames < ActiveRecord::Migration
  def up
    change_column :games, :favorites_count, :integer, default: 0
  end
  def down
    change_column :games, :favorites_count, :integer
  end
end
