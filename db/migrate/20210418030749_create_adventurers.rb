class CreateAdventurers < ActiveRecord::Migration[5.2]
  def change
    create_table :Adventurers do |t|

      t.string :name
      t.string :fantasy_origin
      t.string :class
      t.string :hometown
      t.string :background
      t.string :weapon
      t.string :nemesis

      t.integer :experience_level
      t.integer :user_id
    end
  end
end
