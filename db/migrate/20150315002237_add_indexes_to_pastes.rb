class AddIndexesToPastes < ActiveRecord::Migration
  def change
  	add_index :pastes, :pastebin_id, unique: true 
  end
end
