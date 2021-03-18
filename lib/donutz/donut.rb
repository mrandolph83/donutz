class Donutz::Donut
  
  attr_accessor :name, :qty, :url
  
  @@all = []
  
  def initialize(name, qty, url)
    @name = name
    @qty = qty
    @url = url
    save
  end
  
  def self.all
    Donutz::Scraper.scrape_menu if @@all.empty?
    @@all
  end
  
  def self.qty_update(selected_donut, purchase_qty)
    selected_donut.qty = selected_donut.qty - purchase_qty.to_i
  end
  
  def save
    @@all << self 
  end 
  
  
  
end