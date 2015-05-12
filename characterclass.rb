
class Character
  
  def initialize  
    @name = char_name
  end
  
  def char_name
    names = ["Idriys", "Nate", "Colette", "Emerson", "Tyrell", "Mike", "Andrea", "Will", "Kairsten", "Exal", "Chris", "Tina", "Ellie"].shuffle
    names[-1]
    names.pop
  end
end

#=====================================================================

class Enemy < Character
  attr_reader :name
  attr_accessor :curr_enemy, :strength, :health
  
  def initialize
    @strength = rand(100)
    @name = char_name
    @health = 50
    puts "You found a new enemy: #{@name}"
  end
end

#======================================================================
  
class Hero < Character
  attr_reader :name
  attr_accessor :health, :strength
  
  def initialize
    @strength = rand(100)
    @name = char_name
    @health = 100
    puts "Your name is #{@name}. You begin this mission with #{@strength} strength and #{@health} health. Good luck!"
  end
  
  def run_health_loss
    loss = 2
    @health -= loss
    puts "You lost #{loss} health. Your new health is #{@health}."
  end
  
  def rand_health_loss
    loss = rand(10)
    @health -= loss
    puts "You lost #{loss} health. Your new health is #{@health}."
  end
end
#==================================================================