# OOPsie Project
# Raphael Adams

class Creature
  attr_reader :name
  attr_reader :age
  attr_reader :num_legs

  def initialize(name, age, num_legs = 4)
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
    if @items.key?(gift) && @items[gift] >= num
      recipient.items[gift] += num
      @items[gift] -= num
    else
      puts "#{ @name } can't give #{ num } #{ item }."
    end
    # should give_item "know" anything about the other object??
  end

  def receive_item(item, num, giver)
    gift = item.to_sym
    if @items.key?(gift)
      @items[gift] += num
      giver.give_item(item, num, self)
    else
      puts "#{ @name } can't receive #{ item }."
    end
    # should receive_item "know" anything about the other object??
  end
end