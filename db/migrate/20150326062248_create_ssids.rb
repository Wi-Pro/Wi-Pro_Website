class CreateSsids < ActiveRecord::Migration
  def change
    create_table :ssids do |t|
      t.integer :wiproid
      t.string :ssid
      t.boolean :connected
      t.string :password

      t.timestamps
    end
  end
end
