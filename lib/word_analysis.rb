module WordAnalysis


	def self.word_rank(words, popular_words={}) 
		words.each do |word| 
	    key = word.downcase 
	    if popular_words[key].nil? 
	        popular_words[key] = 1 
	    else
	        popular_words[key] += 1
	    end
		end

		popular_words
	end

	def self.split_words(body) 
		body.split(/\s+/).delete_if{|word| word.blank?}
	end
end