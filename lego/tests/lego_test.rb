# Lego Tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../lego'


class LegoHatTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
    #assert_raises(NameError) { @lego_hat = LegoHat.new(4, "red", "baseball cap") }
  end

  def test_to_s
    #TODO
    assert_raises(NameError) { @lego_hat.to_s }
  end
end


class LegoItemTest < Minitest::Test
  def setup
    @lego_item = LegoItem.new("coffee", 10)
  end

  def test_to_s
    assert_equal @lego_item.to_s, "a 10 gram coffee"
  end

  def test_is_heavy
    refute @lego_item.is_heavy(10)
    assert @lego_item.is_heavy(9)
  end
end


class LegoMinifigureTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
    @lego_item = LegoItem.new("coffee", 10)

    @lego_minifigure_nothing = LegoMinifigure.new("Homer")
    @lego_minifigure_hat = LegoMinifigure.new("Marge", @lego_hat)
    @lego_minifigure_leftitem = LegoMinifigure.new("Bart", @lego_item)
    @lego_minifigure_rightitem = LegoMinifigure.new("Lisa", nil, nil, @lego_item)

    @lego_minifigure_hat_leftitem = LegoMinifigure.new("Ned", @lego_hat, @lego_item)
    @lego_minifigure_hat_rightitem = LegoMinifigure.new("Krusty", @lego_hat, nil, @lego_item)
    @lego_minifigure_leftitem_rightitem = LegoMinifigure.new("Bob", nil, @lego_item, @lego_item)
    @lego_minifigure_everything = LegoMinifigure.new("Mr. Burns", @lego_hat, @lego_item, @lego_item)
  end

  def test_to_s
    assert_equal @lego_minifigure_nothing.to_s, 
      "A Lego minifigure named Homer."
    assert_equal @lego_minifigure_hat.to_s, 
      "A Lego minifigure named Marge, who is wearing a 4 red baseball cap."
    assert_equal @lego_minifigure_leftitem.to_s, 
      "A Lego minifigure named Bart, who is holding a 10 gram coffee in the left hand."
    assert_equal @lego_minifigure_rightitem.to_s, 
      "A Lego minifigure named Lisa, who is holding a 10 gram coffee in the right hand."

    assert_equal @lego_minifigure_hat_leftitem.to_s, 
      "A Lego minifigure named Ned, who is wearing a 4 red baseball cap and is holding a 10 gram coffee in the left hand."
    assert_equal @lego_minifigure_hat_rightitem.to_s, 
      "A Lego minifigure named Krusty, who is wearing a 4 red baseball cap and is holding a 10 gram coffee in the right hand."
    assert_equal @lego_minifigure_leftitem_rightitem.to_s, 
      "A Lego minifigure named Bob, who is holding a 10 gram coffee in the left hand and is holding a 10 gram coffee in the right hand."
    assert_equal @lego_minifigure_everything.to_s, 
      "A Lego minifigure named Mr. Burns, who is wearing a 4 red baseball cap and is holding a 10 gram coffee in the left hand and is holding a 10 gram coffee in the right hand."
  end
end