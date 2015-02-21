class CreateWipros < ActiveRecord::Migration
  def change
    create_table :wipros do |t|
      t.primary_key :wpid
      t.text :wpname
    end
  end
end
