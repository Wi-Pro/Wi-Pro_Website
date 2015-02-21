class CreateHexes < ActiveRecord::Migration
  def change
    create_table :hexes do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
