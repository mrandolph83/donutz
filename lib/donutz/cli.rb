require 'pry'
class Donutz::CLI 
  
attr_accessor :order_name
  
  def call
    new_order
    get_menu
    donut_menu_first_purchase
  end
     
  def new_order
    puts "Welcome! Please enter a name for your order:"
    puts ""
    @order_name = gets.strip
    # instantiates new :order_name in Transaction class. Make name colorized
  end
  
  def get_menu
    @donut_selection = Donutz::Donut.all
    puts ""
    puts "Thanks #{@order_name}! Please type in your selection (1-#{@donut_selection.length}) using the numbered list below:"
    puts "The red numbers indicate how many donuts are currently in stock."
    puts ""
    # binding.pry
  end
  
  def donut_menu_first_purchase
    @donut_selection.each.with_index(1) {|(donut, qty), index|
     puts "#{index}: #{donut.name} - #{donut.qty}"
    }
    make_selection
  end
  
    def donut_menu_later_purchases
    puts "What else would you like to add to your order?"
    @donut_selection.each.with_index(1) {|(donut, qty), index|
     puts "#{index}: #{donut.name} - 24"
    }
    make_selection
  end
  
  def make_selection
    input = gets.strip.to_i
    valid_selection(input) 
  end
  
  def valid_selection(input)
    last_menu_item = @donut_selection.length
   if input.between?(1, last_menu_item)
    qty_selection(input)
   else
    puts "Please enter a valid number (1-#{@donut_selection.length}) to continue your order."
     make_selection
    end
  end
 
  
  def qty_selection(input)
    selected_donut = @donut_selection[input-1]
    puts ""
    puts "Please enter how many #{selected_donut.name} donuts you would like." 
    puts "Type 'i' for more information about this donut."
    puts ""
    qty = gets.strip
    # if valid_qty(qty)
    if qty.upcase == "I"
      donut_information(selected_donut)
    elsif valid_qty(qty.to_i, selected_donut)
       purchase_qty(qty, selected_donut)
    else 
      puts "Please enter a valid qty. There are #{selected_donut.qty} #{selected_donut.name} donuts left at our store."
      qty_selection(input)
    end
  end
  
  def donut_information(selected_donut)
    selected_info = Donutz::Scraper.scrape_info(selected_donut)
    puts "Awesome picture"
    # @donut_selection.pic. I'm guessing the object is pic url
    puts "#{selected_info}"
  end
  
  def valid_qty(qty, selected_donut)
    qty.between?(1, selected_donut.qty)
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
   puts "Thank you #{@order_name}! Your order is listed below. Press [p] to print." 
   puts ""
   puts "Glazed - $12"
   puts "Chocolate Sprinkes - $13"
  end

end