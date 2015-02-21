class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :server
      t.attachment :hexfile

      t.timestamps
    end
  end
end
