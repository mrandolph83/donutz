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
    @donut_selection = Donutz::Donut.all
  end
  
  def donut_menu_first_purchase
    @donut_selection.each.with_index(1) {|donut, index|
     puts "#{index}: #{donut.name} - 24"
    }
    make_selection
  end
  
    def donut_menu_later_purchases
    puts "What else would you like to add to your order?"
    @donut_selection.each.with_index(1) {|donut, index|
     puts "#{index}: #{donut.name} - 24"
    }
    make_selection
  end
  
  def make_selection
    input = gets.strip.to_i
    qty_selection(input) if valid_selection(input, @donut_selection) 
  end
  
    def valid_selection(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
 
  
  def qty_selection(input)
    selected_donut = @donut_selection[input-1]
    puts ""
    puts "Please enter how many #{selected_donut.name} donuts you would like." 
    puts "Type '0' for more information about this donut."
    puts ""
    qty = gets.strip.to_i
    if qty == 0
      donut_information(selected_donut, input-1)
    else  
      purchase_qty(qty, selected_donut)
    end
  end
  
  def donut_information(selected_donut, input)
    puts selected_donut.name
    puts input
  # Get information about the selected donut, as well as a picture
    puts "This donut likes to go on long walks on the beach, and is a big Bridgerton fan."
  end

# binding.pry
    
  def purchase_qty(qty, selected_donut)
   puts "You have ordered #{qty} #{selected_donut.name} doughnuts."
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