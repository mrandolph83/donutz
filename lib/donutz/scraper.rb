class Donutz::Scraper
  
  def scrape_donut_menu
    doc = NokoGiri::HTML(open("https://www.krispykreme.com/menu/doughnuts"))
  end
  
end 