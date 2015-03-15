class IncreaseMaxSizeOfTextField < ActiveRecord::Migration
  def change
  	# 10 MB limit 
  	change_column :pastes, :contents, :text, limit: 10485760
  end
end
