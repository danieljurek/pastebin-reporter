class Paste < ActiveRecord::Base
	include WordStatsCalculatable
	has_many :words_pastes
end
