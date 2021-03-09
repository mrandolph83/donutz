require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
    doc = Nokogiri::HTML(open("https://www.toppotdoughnuts.com/pages/doughnuts"))
    donuts = doc.css("button")
    donuts.each do |each_donut|
      puts each_donut.text
    end
    binding.pry
    
  end
  
end 