module WordStatsCalculatable
	extend ActiveSupport::Concern 

	included do
		require 'word_analysis'
		after_create :log_word_stats
	end 

	private 
	def log_word_stats
		ranks = WordAnalysis.word_rank(WordAnalysis.split_words(contents)) 
		ranks.each do |word, frequency| 
			WordsPaste.create(word: Word.get(word), paste: self, frequency: frequency) 
		end
	end
	handle_asynchronously :log_word_stats


end
