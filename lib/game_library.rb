#need json because it is the document storing values for users
require "json"


class GameLibrary 
  attr_reader :count 

  #here I am initalizing the instance variable to = the method read user games, as the IV stores the function of read user games which is to read
  #the information in attached JSON file. but now the information can be used elsewhere!
  def initialize
    @user_games = read_user_games
    @count = @user_games.length 
  end 

  def game_instances
    puts @count 
  end

  #file.read means it will read the file in the (), also the data local variable only made so you could use parse to make the contents of the 
  #json look nice in Ruby 
  def read_user_games
    data = File.read("#{Dir.home}/Desktop/my_app/public/user_games.json")
    JSON.parse(data)
  end

  #this allows me to add new games - i.e. file.write does this to the file in the path, pretty generates this from the @user games 
  #IV and all its associated stuff
  def write_games
    File.write("#{Dir.home}/Desktop/my_app/public/user_games.json", JSON.pretty_generate(@user_games))
  end

  #made a method to identify what to delete in def find. it takes title, which is a local variable of delete_games below to get user input of what,
  # to delete. but because it's being passed to the method find as an argument (title), it works! then using .find on @user_games which contains
  #all the games, and specifies game as a parameter in the pipes. thus because game(contents of the json) are a hash, you just do [] with title,
  #which is the name of the key. and say that is equal to title. that is, when asked what to delete, the person types the title, then they confirm it.
  #they want to delete the title. then new variable called game is made - and game = the product of what happens in the find method. so, 
  #in find, title is put in the (), i.e. the gets asking for what to delete (halo), basically. then ruby looks through @user_games with .find do
  #and looks for a title which is the value of the title key, then if that title == to the gets.chomp then it will be selected, and back in 
  #delete games the found title will be deleted. 
  def find(title)
    @user_games.find do |game|
      game["title"] == title 
    end 
  end

  def delete_games
    puts "what game would you like to delete?"
    puts "select by title"
    print '> '
    title = gets.chomp
    puts "are you sure you want to delete #{title}? Type yes or no"
    confirm_delete = gets.chomp
    if confirm_delete == "yes"
      game = find(title) 
      @user_games.delete(game)
      puts "#{title} successfully removed!"
       @count -= 1
    else confirm_delete == "no"
      puts "deletion cancelled"
    end
  end

  #method to actually add games, will be used in the main menu 
  def games_input
    puts "what game would you like to add?"
    print '> '
    @entry = gets.chomp
    puts "Great! what genre is this game?"
    print '> '
    @genre = gets.chomp
  end

  def add_title
    games_input
    @user_games << {"title" => @entry, "genre" => @genre}
    @count += 1
  end

  #user games has the information from the JSON, and can thus puts it. 
  #game is a hash - thus don't need two parameters, it has title and genre from the JSON
  def user_games_lister  
    data = @user_games.map do |game|
      [game["title"], game["genre"]]
    end
    terminal_table(data)
  end 

  def terminal_table(games)
    table = Terminal::Table.new({headings: [:title, :genre], rows: games })
    puts table
  end


end 


