class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :groupid
      t.integer :userid

      t.timestamps
    end
  end
end
