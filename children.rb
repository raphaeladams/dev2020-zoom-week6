# OOPsie Project
# Raphael Adams

require_relative 'parent'
require_relative 'modules'

class Dog < Creature

  include WakingAndSleeping
  include DoesTricks
  
  attr_reader :breed

  def initialize(name, age, breed)
    super(name, age)
    @breed = breed
    @items[:bones] = 3
  end

  def speak
    puts "#{ @name } says Woof!"
    yield
  end

  def bury_bone
    if @items[:bones] > 0
      puts "#{ @name } buries a bone!"
      @items[:bones] -= 1
    else
      puts "#{ @name } has no bones to bury."
    end
  end

  def wag_tail
    puts "#{ @name } wags tail"
  end
end

class Cat < Creature

  include WakingAndSleeping

  attr_reader :breed

  def initialize(name, age, breed)
    super(name, age)
    @breed = breed
    @items[:string] = 1
  end

  def speak
    puts "#{ @name } says Meow!"
    yield
  end

  def play
    puts "#{ name } plays with string"
  end

  def scratch
    puts "#{ @name } scratches the sofa"
  end
end

class Alien < Creature

  include WakingAndSleeping
  include DoesTricks
  include GetsDressed

  attr_reader :home_planet

  def initialize(name, age, num_legs, home_planet)
    super(name, age, num_legs)
    @home_planet = home_planet
    @items[:ray_gun] = 2
  end

  def move
    puts "#{ @name } flies in spaceship"
  end

  def attack
    puts "#{ @name } fires ray guns"
  end

  def eat
    puts "#{ @name } eats Reeses Pieces"
  end
end