# OOPsie Project
# Raphael Adams

class Creature
  attr_reader :att1
  attr_reader :att2
  attr_reader :att3

  def initialize(att1, att2, att3)
    @att1 = att1
    @att2 = att2
    @att3 = att3
    @items = Hash.new
  end

  def move
  end

  def speak
  end

  def give_item(item, num, recipient)
  end

  def receive_item(item, num, giver)
  end
end