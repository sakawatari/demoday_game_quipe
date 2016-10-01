class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
        t.string :hardware
        t.string :maker
        t.timestamps null: false
    end
  end
end
