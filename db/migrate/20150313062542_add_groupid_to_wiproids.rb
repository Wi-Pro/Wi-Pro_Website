class AddGroupidToWiproids < ActiveRecord::Migration
  def change
    add_column :wiproids, :groupid, :integer
  end
end
