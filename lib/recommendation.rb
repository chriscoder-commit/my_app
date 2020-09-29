require_relative "menu_assist"

class Recommendation
  include MenuAssist 

  def best_games
    puts ["Fall Guys", "FTL", "God of War", "The Binding of Isaac", "Fortnite", "Avengers", "Plants v Zombies", "Guild Wars 2", "Slay The Spire", "Bloodborne", "Among Us", "No Man's Sky"].sample
  end 

  def recommend   
    PROMPT.select("What kind of game do you feel like?".colorize(:color => :blue)) do |menu|
      menu.choice({ name: "Action", value: "1" })
      menu.choice({ name: "RPG", value: '2' })
      menu.choice({ name: "Online", value: '3' })
      menu.choice({ name: 'Srategy', value: '4' })
      menu.choice({ name: 'Platformer', value: '5'})
      menu.choice({ name: 'return to previous menu', value: '6'})
      menu.choice({ name: 'Choose for me', value: '7'})
      end
  end
  
  def recommendation_menu
    puts "Okay what kind of game do you feel like?"
    loop do 
      case recommend
      when "1"
         puts "Guns or Swords? (type guns or swords)"
         choice = gets.chomp
         if choice == "guns"
          puts "Destiny 2"
          puts "Go get 'em!"
         elsif choice == "swords"
          puts "Dark Souls!"
          puts "Now, prepare to... have fun!"
         else 
            puts "ERROR! try again"
         end  
      when "2"
         puts "new, old or getting really old? type: (new, old, really old)"
         choice = gets.chomp 
         if choice == "new"
          puts "Baulder's Gate 3"
          puts "No save scumming! >:("
         elsif choice == "old"
          puts "it's always a good time to play the Mass Effect trilogy!"
         elsif choice == "really old"
          puts "I hope you like Star Wars, you're playing Knights of The Old Republic!"
         else 
          puts "ERROR! try again"
         end 
      when "3"
         puts "MMO or multiplayer?"
         choice = gets.chomp
         if choice == "MMO".downcase
          puts "Are you just going to play WoW?"
            choice2 = gets.chomp
            if choice2 == "yes"
              puts "Ugh, fine!"
            elsif choice2 == "no" 
              puts "good decision, go play Guild Wars 2 or wait for Ashes of Creation!"
            else 
              puts "ERROR! try again"
            end
          elsif choice == "multiplayer"
              puts "IDK, how about Fall Guys?"
          else 
              puts "ERROR! try again" 
         end
      when "4"
         puts "There is no discussion to be had, play Stellaris or TotalWar Warhammer"
      when "5"
         puts "Y tho?"
      when "6"
          puts "returning"
          break 
      when "7"
          satisfied = false 
          while satisfied == false do 
            puts "do you want to play, #{best_games}type yes or no?"
            answer = gets.chomp
              if answer == "no"
                puts "hmm, bummer!"
                satsified = false
              elsif answer == "yes"
                puts "Go for it!"
                exit
              else 
                puts "ERROR! try again"
              end
          end
        end 
      end
    end
end 