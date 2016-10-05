class AddGameIdToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :game_id, :integer
  end
end
