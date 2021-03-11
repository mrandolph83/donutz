require 'pry'
class Donutz::Order
  
  @@orders = []
  
  attr_accessor :order_name, :order_items
  
  def initialize(order_name)
    @order_name = order_name
    @order_items = []
    save
  end 
 
  def save
    @@orders << self 
   
  end
  
  
  def self.add_to_order(selected_donut, qty)
   @order_name
  binding.pry
  end
  
  def self.all
    @@orders
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