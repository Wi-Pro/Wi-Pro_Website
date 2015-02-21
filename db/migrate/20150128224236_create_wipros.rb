class CreateWipros < ActiveRecord::Migration
  def change
    create_table :wipros do |t|
      t.primary_key, :wpid
      t.text, :wpname
      t.timestamps
    end
  end
end
