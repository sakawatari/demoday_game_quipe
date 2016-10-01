class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
        t.string :title
        t.string :maker
        t.string :maker_genre
        t.string :released_date
        t.timestamps null: false
    end
  end
end
