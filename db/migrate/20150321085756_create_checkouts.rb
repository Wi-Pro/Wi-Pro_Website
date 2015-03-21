class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :userid
      t.integer :wiproid

      t.timestamps
    end
  end
end
