require './characterclass.rb'

class AdventureGame
  attr_accessor :total_moves, :direction, :hero, :enemy
  
  def initialize
    @direction = ["north", "south", "east", "west"]
    @total_moves = 2
    puts "You are a guest in Idriys' nightmares. Feel free to roam. Beware of monsters and hazards. They may hurt you but don't worry. Mom will help you out along the way. You will begin with 10 total moves."
    puts " "
    @hero = Hero.new
  end

  def hero_status
    hero.status
  end

  def battle_stats
    puts "#{enemy.name}"
    # hero.status + enemy.status
  end
  
  def choose_path
    puts "Please choose a path: North, South, East, or West."
    userinput = gets.chomp

    if userinput == "north" || userinput == "south" || userinput == "east" || userinput == "west"
      puts "You chose to go #{userinput.upcase}. You will find some suprises along this path."
      2.times do
        haz_enemy_shuff
      end
      @total_moves -= 1
      choose_again
    
    else
      puts "Sorry, I don't understand your choice."
      choose_path
    end
  end
  
  def choose_again
    puts 'Do you wish to continue down this path or change direction? Type "1" to Continue and "2" to Change Direction.'
    userinput = gets.chomp

    if userinput == "1"
      puts "You chose to CONTINUE. Let's see what awaits us down this path."
      @total_moves -= 1
      haz_enemy_shuff

    elsif userinput == "2"
      puts "You chose to CHANGE DIRECTION. Let's see what awaits us down this path."
      choose_path
      @total_moves -= 1
    
    else
      puts "Sorry, I don't understand your choice."
      choose_again
    end
  end

  def fight_or_flight
    puts 'To fight or not to fight? You may gain strength from winning this battle but losing could lose you your life. Running will cause you to lose 2 health and 2 strength. Press "1" to FIGHT, "2" to RUN, or "status" to see yours and the enemy\'s status.'
    userinput = gets.chomp

      if userinput == "status"
        battle_stats
      end

      if userinput == "1"
        puts "You chose to FIGHT! Do you wish to use a weapon?"

        if hero.strength > enemy.strength
        hero.strength += 15
        puts "You win the battle against #{enemy.name} and gain 15 strength."
        hero.rand_health_loss

        elsif hero.strength < enemy.strength
           hero.strength -= 15
           puts "#{enemy.name} wins the battle."
           hero.rand_health_loss

        else
          hero.strength -= 7 and enemy.strength -= 7
          puts "It's a draw! You lose 7 strength."
          hero.rand_health_loss
        end

      elsif userinput == "2"
        puts "You chose to run."
        hero.run_health_loss

      else
        fight_or_flight
      end
  end

#next code was the only way not to invoke all of the methods. arrays and hashes failed at this.
  def haz_enemy_shuff
    choice = rand(3)

    case
    when choice == 0
      rand_enemy

    when choice == 1
      clear_forgive

    when choice == 2
      rand_haz

    when choice == 3
      found_weapon
    end
  end

  # def enemy
  #   @enemy = Enemy.new
  # end

  def rand_enemy
    @enemy = Enemy.new
    fight_or_flight
  end

  def clear_forgive
    puts "You have encountered the clearance of forgiveness and will pass untouched. Your health is still #{hero.health}. \n\r"
  end

  def rand_haz
    haz = ["Alligator Pit", "Hell Hounds", "Razorblade Shower"].sample
    puts "You have encountered the #{haz}."
    hero.rand_health_loss
  end

  def found_weapon
    name = ["Ball-shredder", "Dorkinator", "Numbnutter", "Tittilator", "Tickler"].shuffle[-1]
    damage = rand(6)
    hero.weapon = name
    puts "You found a weapon called #{hero.weapon} worth #{damage} damage! \n\r"
    hero.strength += damage
  end
end

idriys = AdventureGame.new
idriys.battle_stats


