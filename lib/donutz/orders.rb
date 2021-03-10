class Donutz::Orders
  
  @@orders = []
  
  attr_accessor :order_name, :donut, :qty_ordered
  
  def initialize(order_name)
    @order_name = order_name
    save
  end 
  
  def save
    @@orders << self 
  end
  
  def take_order(name, donut, qty_ordered)
    # takes in donut name and quanity. Adds to order
    # Saves order as an object
    
  end
    
  
  # Intantiate a new order 
  # Have an array or hash that includes all names and orders (do I loop call?), including name, donuts, and qty of each donut.
  # Takes care of quantity counts and updates @donut_selection variable
  
end