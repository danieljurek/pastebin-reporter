class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.string :value 

      t.timestamps null: false
    end

    create_table :words_pastes do |t|
    	t.belongs_to :word, index: true 
    	t.belongs_to :paste, index: true 
    end
  end
end
