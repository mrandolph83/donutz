require 'pry'
class Donutz::Scraper
  
  def self.scrape_quotes
    doc = Nokogiri::HTML(open("https://sayingimages.com/donut-quotes/"))
    donut_quotes = []
    doc.css("em").each do |quotes|
    donut_quotes << quotes.text
   end
    donut_quotes.pop
    donut_quotes.sample
  end
  
  def self.scrape_menu
      doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
      doc.css("h4 > a").each do |donut_traits|
      name = donut_traits.text
      qty = 36
      url = donut_traits.attr("href")
     
      Donutz::Donut.new(name, qty, url)
   end
  end
  
  def self.scrape_info(selected_donut)
    info_scrape = Nokogiri::HTML(open("#{selected_donut.url}"))
    information = info_scrape.css("div[class='text text-page'] > p")
    info = information.text
   
    picture = info_scrape.css("div[class='image'] > img")
    pic_selection = picture[-1]
    pic_select = pic_selection.attributes.values[-2]
    pic = pic_select.value.split(" ").first
    
    nutrition_url = info_scrape.css("div[class='btns'] > a")
    nutrition = nutrition_url.attr("href").value
    
    Donutz::Information.new(info, pic, nutrition)
  end
  
  def self.pic_selection
    puts @pic
  end
  
  def self.nutrition
    puts @nutrition
  end
    
end 