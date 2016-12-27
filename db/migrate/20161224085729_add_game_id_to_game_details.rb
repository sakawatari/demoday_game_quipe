class AddGameIdToGameDetails < ActiveRecord::Migration
  def change
    add_column :game_details, :game_id, :integer
  end
end
