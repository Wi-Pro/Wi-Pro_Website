class CreateWipros < ActiveRecord::Migration
  def change
    create_table :wipros do |t|
      t.string :wpid
      t.text :wpname
    end
  end
end
