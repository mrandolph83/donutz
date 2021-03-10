class Donutz::Donut
  
  attr_accessor :name, :qty
  
  @@all = []
  
  def initialize(name, qty)
  @name = name
  @qty = qty
  save
  end
  
  def self.all
    Donutz::Scraper.scrape_menu if @@all.empty?
    @@all
  end
  
  def save
    @@all << self 
  end 
  
  
  
end