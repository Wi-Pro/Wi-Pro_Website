class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :signature
      t.integer :flash_size
      t.integer :pin_count

      t.timestamps
    end
  end
end
