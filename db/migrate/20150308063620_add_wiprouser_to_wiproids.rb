class AddWiprouserToWiproids < ActiveRecord::Migration
  def change
    add_column :wiproids, :wiprouser, :string
  end
end
