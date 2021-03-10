class Donutz::Orders
  
  @@orders = []
  
  attr_accessor :order_name, :order
  
  def initialize(order_name)
    @order_name = order_name
    @order = []
    save
  end 
  
  def save
    @@orders << self 
  end
  
  def take_order(name, donut, qty_ordered)
    # Create a new hash with donut name and qty amount in a hash, i.e. "Glazed => 24"
    # takes in donut name and quanity. Adds to order
    # Saves order as an object
    
  end
  
  # def remove_item
  #   Take a donut off from the list. Replenish qty of that donut
  # end
    
  
  # Intantiate a new order 
  # Have an array or hash that includes all names and orders (do I loop call?), including name, donuts, and qty of each donut.
  # Takes care of quantity counts and updates @donut_selection variable
  
end