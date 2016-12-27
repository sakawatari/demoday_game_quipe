class RemoveGameRecommendIdFromRecommends < ActiveRecord::Migration
  def up
    remove_column :recommends, :game_recommend_id
  end

  def down
    remove_column :recommends, :game_recommend_id, :integer
  end
end
