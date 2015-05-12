require './characterclass.rb'
require './advgameclass.rb'

idriys = AdventureGame.new
while idriys.total_moves > 0
  
  idriys.choose_path
  

end

#need to create method that creates enemy to fight to referece in below method. also create weapon module that will add strength. #what can enemy do that hero can't do? Die.
# def fight(enemy)
#     if hero.strength > enemy.strength
#         hero.strength += 5
#         enemy.strength -= 5
#         puts "#{hero.name} wins the battle and gains 5 strength. #{enemy.name} loses 5 strength."
#     elsif hero.strength > enemy.strength
#        hero.strength += 5
#        enemy.strength -= 5
#        puts "#{enemy.name} wins the battle and gains 5 strength. #{hero.name} loses 5 strength."
#     else
#       hero.strength -= 2.5 and enemy.strength -= 2.5
#       puts "It's a draw! You both lost 2.5 strength."
#     end
#   end

#mebbe create a file to write to that keeps enemies and hero info so we don't have to worry about this code keeping that
#formatador ruby gem


