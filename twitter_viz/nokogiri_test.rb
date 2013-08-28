require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter full twitter handle:"
twitter_handle = gets.chomp

File.open('twitter_viz.html', 'w') do |f|
	page = Nokogiri::HTML(open("https://twitter.com/" + twitter_handle))
	
	twitter_info = page.css('.profile-field')
	tweets       = page.css('.tweet p')
	tweet_length  = 0
	tweets.each do |tweet| 
		length = tweet.to_s.length
		tweet_length += length
	end

	f.write "<html>\n"
	f.write "\t<head>\n"
	f.write "\t<meta charset= 'utf-8'>\n"
	f.write "\t<title></title>\n"
	f.write "\t<link rel='stylesheet' type='text/css' href='css/bootstrap.css'>\n"
	f.write "</head>\n"
	f.write "<body>\n"
	f.write "\t" + '<div class="hero-unit">' + twitter_info.to_s + '</div>' + "\n"
	# f.write "\t" + '<div class="container">' 
	f.write "\t" + '<div class="hero-unit">' + "<h2>Length of Tweets on Page: #{tweet_length}</h2>" + '</div>' + "\n"
	# f.write "\t" + '<div class="container">' 
	# number_of_tweets = 0
	tweets.each do |tweet| 
		f.write("\t<div class='well well-large'>" + tweet.to_s + "</div>\n")
		# number_of_tweets += 1
	end 
	# f.write("\t<h1>Number of Tweets: #{number_of_tweets}</h1>\n")
	f.write "\t</div>\n"
	f.write "</body>\n"
	f.write "</html>\n" 
end