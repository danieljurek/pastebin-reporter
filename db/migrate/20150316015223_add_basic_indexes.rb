class AddBasicIndexes < ActiveRecord::Migration
  def change
  	add_index :words, :value, unique: true 
  end
end
