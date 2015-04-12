class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :userid
      t.integer :groupid

      t.timestamps
    end
  end
end
