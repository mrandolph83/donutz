require 'pry'
class Donutz::CLI 
  def call
    puts "Welcome! Please enter a name for your order:"
    new_order
    get_menu
    donut_selection
    # donut_selection - Full selection of KK donuts with current quantity levels
     end
     
  def new_order
    @name = gets.strip
    # instantiates new :order_name in Transaction class. Make name colorized
    puts "Thanks #{@name}! Please make your selection using the numbered list below:"
    puts "The red numbers indicate how many donuts are currently in stock."
  end
  
  def get_menu
    @donut_selection = {"Glazed" => 36, "Chocolate Sprinkles" => 16, "Rainbow Sprinkes" => 42, "Strawberry Glaze" => 22} 
  end
  
  def donut_selection
    @donut_selection.each.with_index(1) {|(donut, qty), index|
     puts "#{index}: #{donut} - #{qty}"
    }
  end
  
  # binding.pryss
end