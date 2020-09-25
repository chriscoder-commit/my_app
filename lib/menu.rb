#links/gems section:
require "tty-prompt"
require_relative 'menu_assist'

#the main-menu class 
class Menu
  #menuassist is for getting my ttyprompt to work, it is connected through that document
  include MenuAssist
  attr_accessor :main_menu, :user_selection_integer, :name_selector

  def initialize 
    @game_library = GameLibrary.new
  end

  #allows user to use arrows to make a selection rather than type numbers
  def menu_arrows   
  PROMPT.select("choose from the following") do |menu|
    menu.choice({ name: "receive a recommendation", value: "1" })
    menu.choice({ name: "view all games", value: '2' })
    menu.choice({ name: "add a game", value: '3' })
    menu.choice({ name: 'exit application', value: '4' })
    end
  end




  #This is where an integer choice has to be made
  def user_selection_integer
    print '> '
    selection = gets.chomp.to_i
  end 

  #name selection method
  def name_selector #class method as it applies to any instance in this class 
    puts "Hi! What's your name?"
    print '> '
    @name = gets.chomp
  end

  #this is the main menu, through which all other features are accessed
  def main_menu
    name_selector
    puts "Okay #{@name}, what would you like to do?"
    loop do
      case menu_arrows
        when "1"
          puts "working"
        when "2"
          puts "your custom list of games:"
          @game_library.user_games_lister
        when "3"
          puts "oh PLEASE still be working!"
          puts "add a game:"
            @game_library.add_title 
        when "4"
          puts "thanks for your time!"
          exit 
        end 
    end 
  end 
end  


