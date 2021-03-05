require 'pry'
class Donutz::CLI 
  def call
    new_order
    get_menu
    donut_menu
  end
     
  def new_order
    puts "Welcome! Please enter a name for your order:"
    puts ""
    @name = gets.strip
    # instantiates new :order_name in Transaction class. Make name colorized
  end
  
  def get_menu
    puts ""
    puts "Thanks #{@name}! Please type in your selection using the numbered list below:"
    puts "The red numbers indicate how many donuts are currently in stock."
    puts ""
    @donut_selection = {"Glazed" => 36, "Chocolate Sprinkles" => 16, "Rainbow Sprinkes" => 42, "Strawberry Glaze" => 22} 
  end
  
  def donut_menu
    @donut_selection.each.with_index(1) {|(donut, qty), index|
     puts "#{index}: #{donut} - #{qty}"
    }
    donut_selection
  end
  
  def donut_selection
    input = gets.strip.to_i
    puts ""
    puts "Yay you did it!"
    qty_selection
  end
  
  def qty_selection
    puts ""
    puts "Please enter how many GLAZED donuts you would like." 
    puts "Type 'm' for more information about this donut."
    input = gets.strip
    purchase_qty
    # How do I tie in their order selection with this statement?
    # if input = "m"
    # donut_information(input)
    # else
    # purchase_qty(input.to_i)
    # end
  end
    
  def purchase_qty
    # Add input variable later
   puts "Does this complete your order? (Y/N)"   
   input = gets.strip
   donut_menu
  end
  
  # binding.pryss
end