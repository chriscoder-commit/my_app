class TimeUsed
  attr_reader :weekly_playtime, :yearly_playtime

  def initialize
    @weekly_playtime = weekly_playtime
    @yearly_playtime = yearly_playtime
  end 

  def user_input
    puts "Do you often play video-games? (yes/no)"
    print '> '
    frequency = gets.chomp
    if frequency == "yes"
      puts "How many hours a week on average do you think you have played video-games in the past month?"
      @weekly_playtime = gets.chomp.to_i
    elsif frequency == "no"
      puts "Are you using a stick to press the keys while you're up on your high horse!?"
      exit 
    else 
      puts "Error! Try again!"
    end 
  end

  def time_wasted
    user_input
    yearly_playtime = (@weekly_playtime * 4) * 12
    puts "Oh wow! So assuming you have sustained this average for the past year, you'd have played for #{yearly_playtime} hours!"
    puts "Are you interested in knowing what else you could have done with this time? (yes/no)"
    print '> '
    interest = gets.chomp
    if interest == "yes"
      puts "Okay!"
      case yearly_playtime 
      when yearly_playtime = 1..30
        puts "working"
      when yearly_playtime = 31..100
        puts "also working"
      when yearly_playtime = 101..1000
        puts "thanks for working"
      end 
    elsif interest == "no"
      puts "Possibly a wise decision!"
      puts "Returning to main menu"
      return
    end 
  end 
  
end 