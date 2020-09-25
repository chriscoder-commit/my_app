#links together files
require_relative 'game_library'
require_relative 'menu'
require_relative 'app_file'

#NOTE - not like linking CSS, i.e. have to paste the index to every document, this single document allows every file included in it to access the others.

app = Menu.new
#menu object, "app" instance of menu class. then passing that variable through to the main menu class method. need to be able to call user sleeciton integer 


app.main_menu
#so initalized instance above called app, then applied the main menu method to run with it, which extensionally runs the name selector 

Menu.menu_arrows
