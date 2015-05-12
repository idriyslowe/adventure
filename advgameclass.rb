require './characterclass.rb'

class AdventureGame
  attr_accessor :total_moves, :direction, :hero
  
  def initialize
    @direction = ["north", "south", "east", "west"]
    @total_moves = 10
    puts "Welcome to Idriys's adventure game. Feel free to roam. Beware of enemies and hazards that can hurt you but don't worry. We will help you out along the way. You will have 10 moves total to pass this game."
    @hero = Hero.new
  end
  
  #mebbe create an @array of enemies so we can call the list in order
  def rand_enemy
    newe = Enemy.new
    fight_or_flight
  end
  
  def clear_forgive
    puts "You have encountered the clearance of forgiveness and will pass untouched. Your health is still #{hero.health}"
  end
  
  def rand_haz
    haz = ["Alligator Pit", "Hell Hounds", "Razorblade Shower"].sample
    hero.rand_health_loss
  end
  
  #this automatically runs methods in array even though i only intend to call one.
  def haz_enemy_shuff
    haz = [rand_haz, rand_enemy, clear_forgive].shuffle[-1]
  end
  
  def choose_path
    puts "Please choose a path: North, South, East, or West."
    userinput = gets.chomp

    if userinput == "north" || userinput == "south" || userinput == "east" || userinput == "west"
      puts "You chose to go #{userinput.upcase}. You will find some suprises along this path."
      2.times do
        haz_enemy_shuff
        @total_moves -= 1
      end
    
    else
      puts "Sorry, I don't understand your choice. Please choose a direction: North, South, East, or West."
    end
  end
  
  def fight_or_flight
    puts 'To fight or not to fight? You may gain strength from winning this battle but losing could lose your life. Running will cause you to lose 2 health and 2 strength. Press "1" to FIGHT or "2" to RUN.'
    userinput = gets.chomp

    loop do unless userinput == "1" || userinput == "2"
      if userinput == "1"
        hero.rand_health_loss
      end

      if userinput == "2"
        hero.run_health_loss
        return
      end

      else
        puts 'Fight or flight!? Press "1" to FIGHT or "2" to RUN.'
      end
    end
  end
  
  #find a place in script to throw weapon in
  def found_weapon
    names = ["Ball-shredder", "Dorkinator", "Numbnutter", "Tittilator", "Tickler"].shuffle[-1]
    damage = rand(6)
    puts "You found a weapon called #{names} worth #{damage} damage!"
    hero.strength += damage
  end
end

idriys = AdventureGame.new
idriys.choose_path
