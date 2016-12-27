class RemoveGameRecommendIdFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :game_recommend_id
  end

  def down
    add_column :games, :game_recommend_id, :integer
  end
end
