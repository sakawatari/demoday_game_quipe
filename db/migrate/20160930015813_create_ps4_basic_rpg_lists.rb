class CreatePs4BasicRpgLists < ActiveRecord::Migration
  def change
    create_table :ps4_basic_rpg_lists do |t|
        t.string :title
        t.string :maker
        t.string :maker_genre
        t.string :genre
        t.string :release_date
        t.timestamps null: false
    end
  end
end
