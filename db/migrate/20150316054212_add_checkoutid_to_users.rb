class AddCheckoutidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :checkoutid, :integer
  end
end
