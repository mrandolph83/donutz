require 'pry'
class Donutz::Order
  
  @@all = []
  
  attr_accessor :name, :order_items
  
  def initialize(name)
    @name = name
    @order_items = []
    save
  end 
 
  def save
    @@all << self 
  end
  
  
  def self.add_to_order(selected_donut, qty)
  selected_donut
  binding.pry
  end
  
  def self.all
    @@oall
  end
  

  
  # def self.new_order(name, donut, qty)
  #   new_order = self.new(name)
  #   @order_items << order_items[donut] = qty
  #   save
   
  # end
  
 
  
  # def remove_item
  #   Take a donut off from the list. Replenish qty of that donut
  # end
    
  
  # Intantiate a new order 
  # Have an array or hash that includes all names and orders (do I loop call?), including name, donuts, and qty of each donut.
  # Takes care of quantity counts and updates @donut_selection variable
  
end