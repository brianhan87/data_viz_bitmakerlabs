require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter full twitter handle:"
twitter_handle = gets.chomp

File.open('books.html', 'w') do |f|
	page = Nokogiri::HTML(open("https://twitter.com/" + twitter_handle))
	tweets         = page.css('.tweet-text')
	twitter_info = page.css('.profile-field')

	f.write "<html>\n"
	f.write "\t<head>\n"
	f.write "\t<meta charset= 'utf-8'>\n"
	f.write "\t<title></title>\n"
	f.write "\t<link rel='stylesheet' type='text/css' href='css/bootstrap.css'>\n"
	f.write "</head>\n"
	f.write "<body>\n"
	
	f.write "\t" + '<div class="hero-unit">' + twitter_info.to_s + '</div>' + "\n"
	f.write "\t" + '<div class="container">' 
	tweets.each   { |tweet| f.write("\t<div class='well well-large'><p>" + tweet.to_s + "</p></div>\n") }
	
	f.write "\t</div>\n"
	f.write "</body>\n"
	f.write "</html>\n" 
end