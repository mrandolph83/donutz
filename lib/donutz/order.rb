require 'pry'
class Donutz::Order
  
  @@all = []
  
  attr_accessor :name, :order_items
  
  def initialize(name)
    @name = name
    @order_items = []
    save
  end 
 
 
 def add_to_order(donut, qty)
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