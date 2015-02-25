class CreateWiproids < ActiveRecord::Migration
  def change
    create_table :wiproids do |t|
      t.string :name
      t.integer :wiproid
      t.integer :userid

      t.timestamps
    end
  end
end
