# OOPsie Project
# Raphael Adams

require_relative 'parent'
require_relative 'children'

horse = Creature.new("Shadowfax", 3)
chicken = Creature.new("Foghorn Leghorn", 45, 2)
dog = Dog.new("Brian", 30, "Lab")
cat = Cat.new("Garfield", 70, "Tabby")
alien = Alien.new("Roger", 20, 6, "Mars")

all_animals = [horse, chicken, dog, cat, alien]

puts "ALL ANIMALS"
all_animals.each do |animal|
  p animal
  animal.move
  animal.speak { puts "What's up #{ animal.name }?" }
  puts "\n"
end

puts "Time to give each other stuff!"
horse.give_item("coffees", 2, dog)
horse.give_item("coffees", 2, alien)
horse.give_item("wines", 2, cat)

dog.give_item("coffees", 5, cat)
dog.give_item("bones", 1, chicken)
dog.give_item("coffees", 1, horse)

alien.give_item("teas", 2, cat)
alien.give_item("teas", 2, chicken)
alien.give_item("string", 1, cat)
puts "\n"

puts "Do your own thing #{ dog.name }!\n"
dog.wake_up
4.times { dog.bury_bone }
dog.wag_tail
dog.barrel_roll
dog.somersault
dog.fall_asleep
p dog
puts "\n"

puts "Do your own thing #{ cat.name }!\n"
cat.wake_up
cat.play
cat.scratch
dog.fall_asleep
p cat
puts "\n"

puts "Do your own thing #{ alien.name }!\n"
alien.wake_up
["shirt", "pants", "shoes"].each { |article| alien.add_clothes(article) }
alien.barrel_roll
alien.somersault
alien.attack
alien.eat
alien.fall_asleep
p alien
puts "\n"