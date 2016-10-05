class RemoveGameIdToGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :game_id
  end
end
