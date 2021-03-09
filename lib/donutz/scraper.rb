require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
    doc = Nokogiri::HTML(open("https://www.toppotdoughnuts.com/pages/doughnuts"))
    donuts = doc.css("button")
    donuts.each do |donut|
      name = donut.text
      Donutz::Donut.new(name)
    end
    # binding.pry
  end
end 