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
  
  def save
    @@all << self 
  end 
  
  
  
end