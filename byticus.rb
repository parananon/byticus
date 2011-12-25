$: << File.expand_path(File.dirname(__FILE__))  

require 'rubygems'
require 'god'
require 'actor'
require 'player'

@god = God.new(self)
@player = Player.new(self)

puts 'Welcome to B Y T I C U S !'
puts 'What be your name, oh great adventurer?'

@player.name?

puts 'Greetings, ' + @player.name + '!'
@god.wait
puts 'The game will now begin!'
puts ''
@god.wait
puts 'You\'re walking down a dark hallway, when you see an old lady. You decide to talk to her. You say:'

@god.input
@god.check

puts 'The lady gets angry and kicks your shins. You lose ' + @player.wound + ' health!'

@player.lose_health

puts 'You now have ' + @player.health + ' health remaining.'
puts ''
@god.wait
puts 'Ouch, you say. Type in fight to attack the lady!'

@god.input
@god.check

until $input == 'fight'
	puts 'Time is money! Type in fight to attack'
	@god.input
  @god.check
end

if $input == 'fight'
	puts 'You attack. The poor lady flees in terror.'
end

puts 'You see a wall. It looks like you can climb it. It may be a shortcut.'
@god.wait
puts 'There is also a pathway to the north.'
@god.wait
puts 'After a moment\'s hesitation, you decide to try the wall. Type in climb to scale the wall.'	

@god.input
@god.check

until $input == 'climb'
  puts 'Type in climb to climb the wall.' 
	@god.input
  @god.check
end

if $input == 'climb'
	puts 'You try to climb the wall, but it is too slippery. you fall and lose ' + @player.wound + ' health!'
	@player.lose_health
  @god.wait
	puts 'You now have ' + @player.health + ' health remaining.'
  @god.wait
	puts 'After your fall, you decide to walk along the path.'
end

until $input == 'walk north'
  puts 'Type in walk north to walk along the path.' 
  @god.input
  @god.check
end  

if $input == 'walk north'
	puts 'You walk along the path. You then come into a clearing, and see a lake. You wash yourself in it. It restores ' + @player.heal + ' health!'
	@god.wait
  @player.gain_health
  puts 'You now have ' + @player.health + ' health!'
end
@god.wait
puts 'Suddenly, you hear footsteps and a low growl. Do you want to [flee], or [attack]?'

@god.input
@god.check

if $input == 'flee'
  puts 'While attempting to flee your leg gets bitten by an infected dog. Your infection results in a loss of ' + @player.infected + ' health, forcing you to rest!'
  sleep 10
  @player.lose_health
  puts 'You awaken with ' + @player.health + ' health remaining.'
end

if $input == 'attack'
  puts 'You shoot an arrow towards the noise, killing a beast. You skin the beast and eat the meat, restoring ' + @player.heal + ' health.'
  $item = 'meat'
  @god.add
  @player.gain_health
  puts 'You now have ' + @player.health + ' health remaining.'
  @god.list
  @god.input
  @god.check
end

puts 'Goodbye!'