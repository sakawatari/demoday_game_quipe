class AddFavoriteCountToGames < ActiveRecord::Migration
  def change
    add_column :games, :favorites_count, :integer
  end
end
