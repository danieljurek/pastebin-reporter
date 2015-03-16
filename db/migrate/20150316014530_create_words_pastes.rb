class CreateWordsPastes < ActiveRecord::Migration
  def change
  	add_column :words_pastes, :frequency, :integer 
  end
end
