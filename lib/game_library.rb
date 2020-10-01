require "json"


class GameLibrary 
  attr_reader :count, :user_games
  attr_writer :genre, :entry

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
  #IV and all its associated stuff. when commented out, i can add a game to the list and it would stay until i closed the app, but wouldn't save.
  #could translate .write to permanently write something to a file.  
  def write_games
    File.write("#{Dir.home}/Desktop/my_app/public/user_games.json", JSON.pretty_generate(@user_games))
  end

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
    print '> '
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


