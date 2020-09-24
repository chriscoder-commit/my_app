#This is where the user will enter their name to be stored
def user_selection
  puts "Welcome to Game Selector 3000!"
  puts "Please enter your name:"
  print '> '
  name = gets.chomp
end 

#this is the main menu, through which all other features are accessed
def main_menu
  puts "Okay #{name}, what would you like to do?"
  puts 
end  
