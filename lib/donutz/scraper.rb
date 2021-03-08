require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
    doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
    donuts = doc.css("h4.title")
    binding.pry
  end
  
end 