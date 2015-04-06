class CreateDevicepreferences < ActiveRecord::Migration
  def change
    create_table :devicepreferences do |t|
      t.integer :deviceid
      t.integer :userid

      t.timestamps
    end
  end
end
