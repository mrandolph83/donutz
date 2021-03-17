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
      # pic = Get pic from gem
     
      Donutz::Donut.new(name, qty, url)
   end
  end
  
  def self.scrape_info(selected_donut)
    
    info_scrape = Nokogiri::HTML(open("#{selected_donut.url}"))
    info = info_scrape.css("div[class='text text-page'] > p")
    pic = info_scrape.css("div[class='image'] > img")
    nutrition = info_scrape.css("div[class='btns'] > a")
    @nutrition_url = nutrition.attr("href").value

    # binding.pry
    pic_selection = pic[-1]
    pic_select = pic_selection.attributes.values[-2]
    @website = pic_select.value.split(" ").first
    
    info.text
  
  end
  
  def self.web_selection
    puts @website
  end
  
  def self.nutrition
    puts @nutrition_url
  end
    
    
  end 