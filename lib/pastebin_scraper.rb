module PastebinScraper 

	require 'open-uri'
	@urls = ['http://pastebin.com/archive', 'http://pastebin.com/trends', 'http://pastebin.com/trends/week' ]

	def self.crawl
		@urls.each do |url| 
			puts "Checking for new pastes in #{url}"
			get_paste_ids url 
		end
	end 

	def self.get_paste_ids(url) 
		page_html = download_string url 

		html_reader = Nokogiri::HTML page_html
		link_nodes = html_reader.css '.maintable tr td:first-child a' 
		hrefs = get_hrefs(link_nodes) 

		hrefs.each do |href|
			new_paste = Paste.find_by_pastebin_id(href) 
			if new_paste.nil? 
				puts "Downloading Paste ID #{href}..."
				begin 
					Paste.create(pastebin_id: href, contents: download_string("http://pastebin.com/raw.php?i=#{href}")) if new_paste.nil?
				rescue => ex 
					puts "Something failed getting #{href}, #{ex.message}"
				end
			end 
		end
	end

	def self.get_paste_body(paste_id)
		url = "http://pastebin.com/raw.php?i=#{paste_id}"
		download_string url 
	end

	def self.download_string(url) 
		open(url).read.to_s
	end

	def self.get_hrefs(raw_link_nodes)
		raw_link_nodes.map {|link| link.attribute('href').to_s.sub('/', '')}.uniq.sort.delete_if {|href| href.empty?}
	end

end 