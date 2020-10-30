# OOPsie Project
# Raphael Adams

require 'minitest/autorun'
require_relative 'parent'
require_relative 'children'
require_relative 'modules'

class OOPsieProjectTest < Minitest::Test
  def setup
    @creature_default_legs = Creature.new("Base Creature 4 Legs", 40)
    @creature_set_legs = Creature.new("Base Creature 8 Legs", 45, 8)

    @dog = Dog.new("Brian", 30, "Lab")
    @cat = Cat.new("Garfield", 70, "Tabby")
    @alien = Alien.new("Roger", 20, 6, "Mars")
  end

  # Superclass attribute is set correctly after initialization
  def test_superclass_attributes
    assert_equal @creature_default_legs.name, "Base Creature 4 Legs"
    assert_equal @creature_default_legs.age, 40
    assert_equal @creature_default_legs.num_legs, 4
    assert_equal @creature_set_legs.num_legs, 8
  end

  # receive() works as expected

  # give() works as expected

  # The output of speak()
  def test_speak
    assert_output("Base Creature 8 Legs says Hi!\nHow do you do\n") do
      @creature_set_legs.speak { puts "How do you do" }
    end

    assert_output("Brian says Woof!\nI dunno, Peter.\n") do
      @dog.speak { puts "I dunno, Peter." }
    end
  end

  # 2 subclass methods
  def test_subclass_methods
    assert_output("Garfield scratches the sofa\n") { @cat.scratch }
    assert_output("Roger flies in spaceship\n") { @alien.move }
  end

  # 2 module methods
  def test_module_methods
    assert_output("[\"baseball cap\", \"shirt\", \"shorts\"]\n") do
      @alien.add_clothes("baseball cap")
      @alien.add_clothes("shirt")
      @alien.add_clothes("shorts")
      p @alien.clothes
    end

    assert_output("Falling asleep... zzzzz ^.^\n") { @cat.fall_asleep }
  end

  # A test that uses refute_equal

  # A test that uses assert_output

  # A test that uses refute_nil

  # A test that uses assert_instance_of
end
