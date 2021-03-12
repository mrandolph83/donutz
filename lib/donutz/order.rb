require 'pry'
class Donutz::Order
  
  @@all = []
  
  attr_accessor :name, :order_items
  
  def initialize(name)
    @name = name
    @order_items = []
  end 
 
 
 def self.add_to_order(donut, qty)
    name = self.name
    order_hash = {donut.name => qty}
    @order_items << order_hash
    
 end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  
end