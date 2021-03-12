require 'pry'
class Donutz::Order
  
  @@all = []
  
  attr_accessor :name, :order_items
  
  def initialize(name, donut, qty)
    if self.name != name
    @name = name
    order_hash = {donut.name => qty}
    @order_items = []
    @order_items << order_hash
    save
    
    else
    order_hash = {donut.name => qty}
    @order_items << order_hash 
    save
    end
  end 
 
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  
end