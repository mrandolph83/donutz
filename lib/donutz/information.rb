class Donutz::Information
  
  attr_accessor :info, :pic, :nutrition
  
  @@all = []
  
  def initialize(info, pic, nutrition)
    @@all = []
    @info = info
    @pic = pic
    @nutrition = nutrition
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end