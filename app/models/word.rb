class Word < ActiveRecord::Base
	belongs_to :words_pastes

	def self.get(word) 
		Word.find_or_create_by(value: word.downcase) 
	end
end
