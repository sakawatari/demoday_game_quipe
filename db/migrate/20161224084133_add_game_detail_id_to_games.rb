class AddGameDetailIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_detail_id, :integer
  end
end
