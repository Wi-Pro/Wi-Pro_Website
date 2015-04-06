class CreateWiproavails < ActiveRecord::Migration
  def change
    create_table :wiproavails do |t|
      t.integer :wiproid

      t.timestamps
    end
  end
end
