namespace :jobs do
  desc "TODO"
  task crawl: :environment do
  	
  	require 'pastebin_scraper'

  	loop do 
  		puts 'Starting crawl...'

  		begin 
  			PastebinScraper.crawl 
  		rescue => ex
  			puts "There was an error crawling... #{ex.message}"
  		end

  		puts 'Sleeping...' 
  		sleep(20) 
  	end
  end

end
