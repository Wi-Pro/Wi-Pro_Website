class AddCheckedoutbyToWiproids < ActiveRecord::Migration
  def change
    add_column :wiproids, :checkedoutby, :integer
  end
end
