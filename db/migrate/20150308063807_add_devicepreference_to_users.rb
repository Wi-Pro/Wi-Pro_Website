class AddDevicepreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :devicepreference, :integer
  end
end
