class Paste < ActiveRecord::Base
	has_and_belongs_to_many :words
end
