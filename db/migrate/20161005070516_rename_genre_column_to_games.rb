class RenameGenreColumnToGames < ActiveRecord::Migration
  def change
      rename_column :games, :genre, :genre_id
  end
end
