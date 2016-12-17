class AddGameRecommendIdToRecommends < ActiveRecord::Migration
  def change
    add_column :recommends, :game_recommend_id, :integer
  end
end
