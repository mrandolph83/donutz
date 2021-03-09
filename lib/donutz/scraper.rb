require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
      doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
      donuts = doc.css("h4 > a")
      urls = doc.css("h4 > a").map { |link| link['href'] }
      donuts.each do |donut|
       donut.text
      Donutz::Donut.new(name)
     binding.pry
    end
  end
  
  # def self.scrape_info(selection)
  # # Have variable read from href, then scrape from that data
  #   donut_info_links = []
  #   doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
  #   donuts = doc.css("h4 > a")
  #   donuts.each do |donut|
  #   name = donut.text
  #   Donutz::Donut.new(name)
  # end
  # # binding.pry
end 