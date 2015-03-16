class WordsPaste < ActiveRecord::Base
	belongs_to :word 
	belongs_to :paste 
end
