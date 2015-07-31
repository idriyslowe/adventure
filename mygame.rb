require './characterclass.rb'
require './advgameclass.rb'

#this loops forever!!!
idriys = AdventureGame.new
while idriys.total_moves >= 0
  
  idriys.choose_path

end

puts "Thank you for playing but you've run out of moves!"

#formatador ruby gem

#i need to come up with some skill here. right now we're just choosing direction and if whether to fight. need to use weapons. pokemon?


