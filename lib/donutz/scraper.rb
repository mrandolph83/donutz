require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
    doc = Nokogiri::HTML(open("https://www.toppotdoughnuts.com/pages/doughnuts"))
    donuts = doc.css("li[data-duo-type='doughnut'] > button")
    selected_donut = donuts.first
    # binding.pry
    donuts.each do |donut|
      name = donut.text
      Donutz::Donut.new(name)
    end
   
  end
  
  # def self.scrape_info
    
  # end
  
end 

# 