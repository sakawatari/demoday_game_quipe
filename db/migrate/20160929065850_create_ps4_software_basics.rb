class CreatePs4SoftwareBasics < ActiveRecord::Migration
  def change
    create_table :ps4_software_basics do |t|
      t.string :title
      t.string :maker
      t.string :genre
      t.string :release_date

      t.timestamps null: false
    end
  end
end
