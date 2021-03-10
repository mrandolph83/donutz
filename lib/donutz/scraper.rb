require 'pry'
class Donutz::Scraper
  
  def self.scrape_menu
      doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
      donuts = doc.css("h4 > a")
      donuts.each do |donut|
      name = donut.text
      qty = 36
      Donutz::Donut.new(name, qty)
    end
  end
  
  def self.scrape_info(input)
    doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
    urls = doc.css("h4 > a").map { |link| link['href'] }
    info_html = urls[input]
    
    info_scrape = Nokogiri::HTML(open("#{info_html}"))
    info = info_scrape.css("div[class='text text-page'] > p")
    pic = info_scrape.css()
    puts "Awesome picture"
    split_text = info.text.split(".")
    join_text = split_text[0..-1].join
    # binding.pry
    join_text
  end
  
  def self.scrape_info
    
end 