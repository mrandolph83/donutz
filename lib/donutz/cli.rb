require 'pry'
class Donutz::CLI 
  
  def call
    new_order
    get_menu
    donut_menu_first_purchase
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
    @donut_selection = ["Glazed", "Chocolate Sprinkles", "Rainbow Sprinkes", "Strawberry Glaze"]
    # Needs scraped for actual KK data
  end
  
  def donut_menu_first_purchase
    @donut_selection.each.with_index(1) {|donut, index|
     puts "#{index}: #{donut} - 24"
    }
    make_selection
  end
  
    def donut_menu_later_purchases
    puts "What else would you like to add to your order?"
    @donut_selection.each.with_index(1) {|donut, index|
     puts "#{index}: #{donut} - 24"
    }
    make_selection
  end
  
  def make_selection
    input = gets.strip.to_i
    qty_selection(input) if valid_selection(input, @donut_selection) 
  end
 
  
  def qty_selection(input)
    selected_donut = @donut_selection[input-1]
    puts ""
    puts "Please enter how many #{selected_donut} donuts you would like." 
    puts "Type 'm' for more information about this donut."
    input = gets.strip
    purchase_qty
end

# binding.pry
  
  def valid_selection(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
    
  def purchase_qty
    #add_to_order
   puts "Does this complete your order? (Y/N)" 
   puts ""
   input = gets.strip.upcase
    if input == "Y"
      complete_order
    else
      donut_menu_later_purchases
    end
  end
  
  # def add_to_order
  #   if amount <= qty left, remove that amount from updated menu selection.
  #   else "There are not enough GLAZED donuts to meet your request. Please enter a new number"
  #   end
  # end
  
  def complete_order
   puts "Thank you #{@name}! Your order is listed below. Press [p] to print." 
   puts ""
   puts "Glazed - $12"
   puts "Chocolate Sprinkes - $13"
  end

end