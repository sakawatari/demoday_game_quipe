class CreateGameRecommends < ActiveRecord::Migration
  def change
    create_table :game_recommends do |t|
      t.integer :game_id
      t.integer :recommend_id

      t.timestamps null: false
    end
  end
end
