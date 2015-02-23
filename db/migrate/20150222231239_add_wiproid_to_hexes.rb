class AddWiproidToHexes < ActiveRecord::Migration
  def change
    add_column :hexes, :wiproid, :integer
    add_column :hexes, :deviceid, :integer
  end
end
