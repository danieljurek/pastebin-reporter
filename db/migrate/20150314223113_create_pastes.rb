class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
    	t.string :pastebin_id
    	t.text :contents 

      t.timestamps null: false
    end
  end
end
