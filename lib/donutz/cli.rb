require 'pry'
require 'colorize'
class Donutz::Cli
  
  
  def call
    new_order
    get_menu
    donut_menu_first_purchase
  end
     
  def new_order
    pink_donutz = "DONUTZ".colorize(:light_magenta)
    yellow_name = "Name".colorize(:yellow)
    
    puts Donutz::Ascii.top_header
    
    puts "\nWelcome to the #{pink_donutz} ordering app!\nPlease enter a #{yellow_name} for your order:"
    puts ""
    
    name = gets.strip
    @order = Donutz::Order.new(name) 
  end
  
  def get_menu
    @donut_selection = Donutz::Donut.all
   
    pink_name = @order.name.upcase.colorize(:light_magenta)
    @yellow_selection_numbers = "(1-#{@donut_selection.length})".colorize(:yellow)
    yellow_text = "yellow".colorize(:yellow)
    
    puts "\nThanks #{pink_name}! Please type in your selection #{@yellow_selection_numbers} using the numbered list below:"
    puts "The #{yellow_text} numbers indicate how many donuts are currently in stock."
    puts ""
  end
  
  def donut_menu_first_purchase
    
    @donut_selection.each.with_index(1) {|(donut, qty), index|
    print "#{index} "
    print "#{donut.name}".colorize(:light_magenta)  
    print " - "
    print "#{donut.qty}\n".colorize(:yellow)
    }
  
    make_selection
  end
  
  def donut_menu_later_purchases
    puts ""
    puts "What else would you like to add to your order?\n"
    
    @donut_selection.each.with_index(1) {|(donut, qty), index|
    print "#{index} "
    print "#{donut.name}".colorize(:light_magenta)  
    print " - "
    print "#{donut.qty}\n".colorize(:yellow)
    }
    make_selection
  end
  
  def make_selection
    puts ""
    input = gets.strip.to_i
    
    if input.between?(1, @donut_selection.length)
    qty_selection(input)
    else
    puts "Please enter a valid number #{@yellow_selection_numbers} to continue your order."
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
    
    if qty.upcase == "I"
      donut_information(selected_donut)
    elsif 
      qty.to_i.between?(1, selected_donut.qty)
      purchase_qty(@order_name, selected_donut, qty)
    else 
      puts "Please enter a valid qty. There are #{selected_donut.qty} #{pink_donut} donuts left at our store."
      qty_selection(input)
    end
  end

  def donut_information(selected_donut)
    Donutz::Scraper.scrape_info(selected_donut)
    info = Donutz::Information.all.last
    pic = info.pic
    nutrition = info.nutrition
    
    yellow_p = "'p'".colorize(:yellow)
    yellow_n = "'n'".colorize(:yellow)
    yellow_enter = "'Enter'".colorize(:yellow)
    
    puts ""
    puts selected_donut.name.upcase.colorize(:light_magenta)
   
    puts "\n#{info.info}\n"
    puts "\nPress #{yellow_p} to open a picture of this donught in your browser,"
    puts "or #{yellow_n} to open nutrition facts."
    puts "\nPress the #{yellow_enter} key to return to the Order Menu."
    puts ""
    
    input = gets.strip
    
    if input == ""
      donut_menu_later_purchases
    elsif input.upcase == "P"
      puts pic
      system("open #{pic}")
      donut_information(selected_donut)
      
    else input.upcase == "N"
      puts nutrition
      system("open #{nutrition}")
      donut_information(selected_donut)
    end
  end
    
  def purchase_qty(name, selected_donut, purchase_qty)
   @order.add_to_order(selected_donut, purchase_qty)
   Donutz::Donut.qty_update(selected_donut, purchase_qty)
   
   puts ""
   puts "You have ordered #{purchase_qty} #{selected_donut.name} doughnuts."
   puts "Does this complete your order? (Y/N)" 
   puts ""
   input = gets.strip
   
    if input.upcase == "Y"
      complete_order
    else
      donut_menu_later_purchases
    end
  end
  
  def complete_order
    name_yellow = @order.name.colorize(:yellow)
    t = Time.new - 14400
    
    puts ""
    puts "Thank you #{name_yellow}! Your order, placed on #{t.month}/#{t.day}/#{t.year} at #{t.strftime("%I:%M %p")}, is listed below." 
    puts ""
    puts Donutz::Order.all.each {|donuts| 
    puts donuts.name.upcase
    puts donuts.order_items
    }
    
    puts Donutz::Ascii.bottom_footer
    quote_selection = Donutz::Scraper.scrape_quotes 
    puts "'#{quote_selection}'".colorize(:yellow)
    next_order
  end
  
  def next_order
    puts "Would you like to place another order? (Y/N)"
    input = gets.strip
    
    if input.upcase == "Y"
      call
    elsif input.upcase == "N"
    nil
    else
    next_order
    end
  end
  
end