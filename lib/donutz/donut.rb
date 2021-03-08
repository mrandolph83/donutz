class Donutz::Donut
  
  attr_accessor :name, :qty
  
  @@all = []
  
  def initialize(name)
  # Set quantity starting at 36 if no qty is given 
  @name = name
  save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end 
  
  
  
end