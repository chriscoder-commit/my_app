class TimeUsed
  attr_reader :weekly_playtime, :yearly_playtime

  def user_input
    puts "Do you often play video-games? (yes/no)"
    print '> '
    frequency = gets.chomp.downcase
    if frequency == "yes"
      begin 
      puts "How many hours a week on average do you think you have played video-games in the past month?"
        @weekly_playtime = Integer(gets.chomp)
        #integer part of kernel module - can be called anywhere on a file, can be called on a particular thing. will try to convert to_int then to_i if that fails. 
        if weekly_playtime == 0
          puts "Please be realistic, you did play video games."
          exit 
        end 
      rescue ArgumentError 
        puts "Error! please type a number!"
        retry 
      end 
    elsif frequency == "no"
      puts "Are you using a stick to press the keys while you're up on your high horse!?"
      exit
    else 
      puts "Error! Try again!"
    end 
  end

  def skills 
    case @yearly_playtime 
    when 1..30
      puts "Did you know you could have learned to drive manual?"
    when 31..100
      puts "also working"
    when 101..500
      french = 400 - @yearly_playtime
      extra_time = french.abs 
      if @yearly_playtime < 400
        puts "Did you know it would take you around 400 hours to learn French? So in around another #{french} hours, you could be annoying friends and family with your fluent skills!"
      else @yearly_playtime > 400
        puts "You could have already learned French with time to spare! Approximately #{extra_time} hours to spare!"
      end 
    when 501..1500
      guitar = 900 - @yearly_playtime
      extra_time = guitar.abs
      puts "Did you know it would take around 900 hours to be able to play any song on guitar? You could even improvise!"
      if @yearly_playtime < 900
        puts "It would only take you another #{guitar} hours to learn this! If you had been practicing instead of playing games..."
      else @yearly_playtime > 900
        puts "You could have already learned guitar, with time to spare! You could have been serenading the world for the last #{extra_time} hours!"
      end 
    when 1501..8760
      puts "Same honestly, but I think we oughta go for a jog or something?"
    when (8761..)
      puts "There aren't that many hours in a year, stop being silly!"
      return 
    end 
  end 

  def time_wasted
    user_input
    @yearly_playtime = ((@weekly_playtime * 4) * 12)
    puts "Oh wow! So assuming you have sustained this average for the past year, you'd have played for somewhere around #{@yearly_playtime} hours!"
    puts "Are you interested in knowing what else you could have done with this time? (yes/no)"
    print '> '
    interest = gets.chomp.downcase 
    if interest == "yes"
      skills 
    elsif interest == "no"
      puts "Possibly a wise decision!"
      puts "Returning to main menu"
      return
    else 
      puts "Error! Try again!"
    end
  end
end 