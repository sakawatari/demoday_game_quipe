class RemoveGameDetailIdFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :game_detail_id
  end

  def down
    remove_column :games, :game_detail_id, :integer
  end
end
