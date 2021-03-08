class Donutz::Donut
  
  attr_accessor :name, :qty
  
  @@all = ["Strawberry", "Vanilla", "Swirl"]
  
  def initialize(name)
  # Set quantity starting at 36 if no qty is given 
  @name = name
  end
  
  def self.all
    @@all
  end
  
  
end