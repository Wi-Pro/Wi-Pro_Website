class CreateHexFiles < ActiveRecord::Migration
  def change
    create_table :hex_files do |t|

      t.timestamps
    end
  end
end
