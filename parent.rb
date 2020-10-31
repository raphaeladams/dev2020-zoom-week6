# OOPsie Project
# Raphael Adams

class Creature

  attr_reader :name
  attr_reader :age
  attr_reader :num_legs
  attr_accessor :items

  def initialize(name, age, num_legs = 4)
    unless (name.is_a? String) && (age.is_a? Integer) && (num_legs.is_a? Integer)
      raise "Invalid, name must be a String and age / num of legs must be Integers"
    end
    @name = name
    @age = age
    @num_legs = num_legs
    @items = { coffees: 3, beers: 4, teas: 2 }
  end

  def move
    puts "#{ @name } runs with #{ @num_legs } legs."
  end

  def speak
    puts "#{ @name } says Hi!"
    yield
  end

  def give_item(item, num, recipient)
    gift = item.to_sym
    if @items.key?(gift) && @items[gift] >= num && recipient.receive_item(item, num)
      @items[gift] -= num
      puts "#{ @name } gives #{ num } #{ item } to #{ recipient.name }!"
    else
      puts "#{ @name } can't give #{ num } #{ item } to #{ recipient.name }."
    end
  end

  def receive_item(item, num)
    gift = item.to_sym
    if @items.key?(gift)
      @items[gift] += num
      true
    else
      false
    end
  end

end
