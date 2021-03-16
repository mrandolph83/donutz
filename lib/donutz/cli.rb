
require 'pry'
require 'colorize'
class Donutz::CLI 
  
  
 
  def call
    new_order
    get_menu
    donut_menu_first_purchase
  end
     
  def new_order
    pink_donutz = "DONUTZ".colorize(:light_magenta)
    yellow_name = "Name".colorize(:yellow)
    puts "

         ▄████████████▄
     ▄███▀░░░░░░░░░░▀███▄
    ███░░░░░░░░░░░░░░░░███
   ██░░░░░░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░░░░░░██
 ██░░░░░░░░░░░░░░░░░░░░░░░░██
██░░░░░░░░▄████████▄░░░░░░░░██
██░░░░░░░███▀    ▀███░░░░░░░██
██░░░░░░░██        ██░░░░░░░██
██░░░░░░░███▄    ▄███░░░░░░░██
██░░░░░░░░▀████████▀░░░░░░░░██
 ██░░░░░░░░░░░░░░░░░░░░░░░░██
  ██░░░░░░░░░░░░░░░░░░░░░░██
   ██░░░░░░░░░░░░░░░░░░░░██
   ███░░░░░░░░░░░░░░░░███
    ▀███▄░░░░░░░░░░▄███▀
       ▀████████████▀".colorize(:light_magenta)
    
    puts "\nWelcome to the #{pink_donutz} ordering app!\nPlease enter a #{yellow_name} for your order:"
    puts ""
    @order_name = gets.strip
    name_entered = @order_name
    @order = Donutz::Order.new(name_entered) # CHANGED THIS 
    # instantiates new :order_name in Transaction class. Make name colorized
  end
  
  def get_menu
    @donut_selection = Donutz::Donut.all
    pink_name = @order_name.upcase.colorize(:light_magenta)
    yellow_selection = "(1-#{@donut_selection.length})".colorize(:yellow)
    yellow_text = "yellow".colorize(:yellow)
    puts "\nThanks #{pink_name}! Please type in your selection #{yellow_selection} using the numbered list below:"
    puts "The #{yellow_text} numbers indicate how many donuts are currently in stock."
    puts ""
    # binding.pry
  end
  
  def donut_menu_first_purchase
    puts ""
    @donut_selection.each.with_index(1) {|(donut, qty), index|
    print "#{index} ".colorize(:light_magenta) 
    print "#{donut.name} - "
    print "#{donut.qty}\n".colorize(:yellow)
    }
    make_selection
  end
  
    def donut_menu_later_purchases
    puts "What else would you like to add to your order?\n"
    @donut_selection.each.with_index(1) {|(donut, qty), index|
    print "#{index} ".colorize(:light_magenta) 
    print "#{donut.name} - "
    print "#{donut.qty}\n".colorize(:yellow)
    }
    make_selection
  end
  
  def make_selection
    puts ""
    input = gets.strip.to_i
    valid_selection(input) 
  end
  
  def valid_selection(input)
    last_menu_item = @donut_selection.length
   if input.between?(1, last_menu_item)
    qty_selection(input)
   else
    yellow_selection = "(1-#{@donut_selection.length})".colorize(:yellow) 
    puts "Please enter a valid number #{yellow_selection} to continue your order."
     make_selection
    end
  end
 
  
  def qty_selection(input)
    selected_donut = @donut_selection[input-1]
    pink_donut = selected_donut.name.upcase.colorize(:light_magenta)
    yellow_i = "'i'".colorize(:yellow)
    puts "\nPlease enter how many #{pink_donut} donuts you would like." 
    puts "Type #{yellow_i} for more information about this donut."
    puts ""
    qty = gets.strip
    # if valid_qty(qty)
    if qty.upcase == "I"
      donut_information(selected_donut)
    elsif valid_qty(qty.to_i, selected_donut)
       purchase_qty(@order_name, selected_donut, qty)
    else 
      puts "Please enter a valid qty. There are #{selected_donut.qty} #{selected_donut.name} donuts left at our store."
      qty_selection(input)
    end
  end
  
    def self.web_link(final_selection)
    return final_selection
    
  end
  
  def donut_information(selected_donut)
    selected_info = Donutz::Scraper.scrape_info(selected_donut)
    yellow_p = "'p'".colorize(:yellow)
    yellow_n = "'n'".colorize(:yellow)
    yellow_enter = "'Enter'".colorize(:yellow)
    puts ""
    puts selected_donut.name.upcase.colorize(:light_magenta)
    # @donut_selection.pic. I'm guessing the object is pic url
    puts "\n#{selected_info}\n"
    puts "\nPress #{yellow_p} to open a picture of this donught in your browser,"
    puts "or #{yellow_n} to open nutrition facts."
    puts "\nPress the #{yellow_enter} key to return to the Order Menu."
    input = gets.strip
    if input == ""
      donut_menu_later_purchases
    elsif input.upcase == "P"
      Donutz::Scraper.web_selection
      donut_information(selected_donut)
    else input.upcase == "N"
      
      donut_information(selected_donut)
    end
  end
  
  def valid_qty(qty, selected_donut)
    qty.between?(1, selected_donut.qty)
  end
    
  def purchase_qty(name, selected_donut, purchase_qty)
   @order.add_to_order(selected_donut, purchase_qty)
   Donutz::Donut.qty_update(selected_donut, purchase_qty)
   puts ""
   puts "You have ordered #{purchase_qty} #{selected_donut.name} doughnuts."
   puts "Does this complete your order? (Y/N)" 
   puts ""
   input = gets.strip.upcase
    if input == "Y"
      complete_order
    else
      donut_menu_later_purchases
    end
  end
  
  
  
  def complete_order
   puts ""
   puts "Thank you #{@order_name}! Your order is listed below. Press [p] to print." 
   puts ""
   puts Donutz::Order.all.each {|donuts| 
   puts donuts.name.upcase
   puts donuts.order_items
   }
   puts "
   
         d888888b                         d888888b
   d888    8888b                    d888888   888b
 d88    88  898888b               d8888  888     88b
d8P        88888888b             d88888888888     b8b
88        8888888888             88888888888       88
88       88888888888             8888888888        88
98b     88888888888P             988888888        d8P
 988     888  8888P      _=_      9888898  88    88P
   9888   888888P      q(-_-)p       98888    888P
      9888888P         '_) (_`         9888888P
         88            /__/  \            88
         88          _(<_   / )_          88
        d88b        (__\_\_|_/__)        d88b".colorize(:light_magenta)
   quote_selection = Donutz::Scraper.scrape_quotes 
   puts "'#{quote_selection}'".colorize(:yellow)
  # binding.pry
  # Time.now stamp
  end

end