#will have actual functions for the library in here, i.e. adding a new game. 


class GameLibrary 

  # def initialize
  #   @user_games = user_games 
  # end 

  #method to actually add games, will be used in the main menu 
  def games_input
    puts "what would you like to add?"
    print '> '
    @entry = gets.chomp
  end

  def add_title
    games_input
    @user_games = [] 
    @user_games << @entry 
  end

  def user_games_lister  
    @user_games.each do |game|
      puts game.capitalize   
    end
  end 


end 


