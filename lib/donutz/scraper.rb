require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
      doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
      donuts = doc.css("h4 > a")
      donuts.each do |donut|
      name = donut.text
      Donutz::Donut.new(name)
    end
  end
  
  def self.scrape_info(input)
  # Have variable read from href, then scrape from that data
    donut_info_links = []
    doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
    urls = doc.css("h4 > a").map { |link| link['href'] }
    urls[input]
  end
  # binding.pry
end 