class Donutz::Scraper
  
  def self.scrape_menu
    doc = Nokogiri::HTML(open("https://shipleydonuts.com/menu/"))
  end
  
end 