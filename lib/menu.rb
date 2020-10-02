# the main-menu class
class Menu
  # menuassist is for getting my ttyprompt to work, it is connected through that document
  include MenuAssist
  attr_reader :game_library

  def initialize
    @game_library = GameLibrary.new
    @recommendation = Recommendation.new
    @time_used = TimeUsed.new
  end

  # allows user to use arrows to make a selection rather than type numbers
  def menu_arrows
    PROMPT.select('choose from the following'.colorize(color: :blue)) do |menu|
      menu.choice({ name: 'receive a recommendation', value: '1' })
      menu.choice({ name: 'view all games', value: '2' })
      menu.choice({ name: 'add a game', value: '3' })
      menu.choice({ name: 'delete games', value: '4' })
      menu.choice({ name: 'time wasted on video games', value: '5' })
      menu.choice({ name: 'exit application', value: '6' })
    end
  end

  # This is where an integer choice has to be made
  def user_selection_integer
    print '> '
    selection = gets.chomp.to_i
  end

  # name selection method
  def name_selector # class method as it applies to any instance in this class
    puts "Hi! What's your name?"
    print '> '
    @name = gets.chomp
  end

  # this is the main menu, through which all other features are accessed
  def main_menu
    name_selector
    puts "Okay #{@name}, what would you like to do?"
    loop do
      case menu_arrows
      when '1'
        @recommendation.recommendation_menu
      when '2'
        puts 'you have the following number of games in your library: '
        @game_library.game_instances
        puts 'your custom list of games:'
        @game_library.user_games_lister
      when '3'
        puts 'add a game:'
        @game_library.add_title
      when '4'
        @game_library.delete_games
      when '5'
        @time_used.time_wasted
      when '6'
        @game_library.write_games
        puts 'thanks for your time!'
        exit
      end
    end
  end
end
