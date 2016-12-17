class AddGameRecommendIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_recommend_id, :integer
  end
end
