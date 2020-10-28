require 'httparty'
require 'nokogiri'
require 'byebug'

def scraper
  url = "https://news.detik.com/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  puts url

  newsFeed = parsed_page.css('div.section>div.list-content>article')
  first = newsFeed
  raw_title = first.css('div.media__text>h3.media__title>a').text
  title = raw_title.gsub(/\n/,'').gsub(/\t/, '').strip


  byebug
end

scraper