class Paste < ActiveRecord::Base
	include WordStatsCalculatable
	belongs_to :words_pastes
end
