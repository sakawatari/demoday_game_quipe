class CreateGameDetails < ActiveRecord::Migration
  def change
    create_table :game_details do |t|
      t.text :amazon
      t.text :yodobashi
      t.text :yahoo_shop
      t.text :official_store
      t.text :official_site
      t.text :wikipedia
      t.text :solution_site
      t.text :youtube
      t.text :niconico
      t.integer :clear_time

      t.timestamps null: false
    end
  end
end
