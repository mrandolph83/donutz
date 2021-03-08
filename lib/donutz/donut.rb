class Donutz::Donut
  
  attr_accessor :name, :qty
  
  @@all = []
  
  def initialize(name)
  # Set quantity starting at 36 if no qty is given 
  @name = name
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