# Lego Tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../lego'


class LegoHatTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
  end

  def test_to_s
    assert_equal @lego_hat.to_s, "a 4 red baseball cap"
  end
end


class LegoItemTest < Minitest::Test
  def setup
    @lego_item = LegoItem.new("coffee", 11)
    @lego_item2 = LegoItem.new("beer", 5)
  end

  def test_to_s
    assert_equal @lego_item.to_s, "a 11 gram coffee"
  end

  def test_is_heavy
    refute @lego_item.is_heavy(11)
    assert @lego_item.is_heavy(9)
  end
end


class LegoMinifigureTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
    @lego_item = LegoItem.new("coffee", 10)

    @lego_minifigure_nothing = LegoMinifigure.new("Homer")
    @lego_minifigure_hat = LegoMinifigure.new("Marge", @lego_hat)
    @lego_minifigure_leftitem = LegoMinifigure.new("Bart", nil, @lego_item)
    @lego_minifigure_rightitem = LegoMinifigure.new("Lisa", nil, nil, @lego_item)

    @lego_minifigure_hat_leftitem = LegoMinifigure.new("Ned", @lego_hat, @lego_item)
    @lego_minifigure_hat_rightitem = LegoMinifigure.new("Krusty", @lego_hat, nil, @lego_item)
    @lego_minifigure_leftitem_rightitem = LegoMinifigure.new("Bob", nil, @lego_item, @lego_item2)
    @lego_minifigure_everything = LegoMinifigure.new("Mr. Burns", @lego_hat, @lego_item, @lego_item2)
  end

  def test_to_s
    assert_equal @lego_minifigure_nothing.to_s, 
      "A Lego minifigure named Homer."
    assert_equal @lego_minifigure_hat.to_s, 
      "A Lego minifigure named Marge, who is wearing a 4 red baseball cap."
    assert_equal @lego_minifigure_leftitem.to_s, 
      "A Lego minifigure named Bart, who is holding a 11 gram coffee in the left hand."
    assert_equal @lego_minifigure_rightitem.to_s, 
      "A Lego minifigure named Lisa, who is holding a 11 gram coffee in the right hand."

    assert_equal @lego_minifigure_hat_leftitem.to_s, 
      "A Lego minifigure named Ned, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the left hand."
    assert_equal @lego_minifigure_hat_rightitem.to_s, 
      "A Lego minifigure named Krusty, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the right hand."
    assert_equal @lego_minifigure_leftitem_rightitem.to_s, 
      "A Lego minifigure named Bob, who is holding a 11 gram coffee in the left hand and is holding a 5 gram beer in the right hand."
    assert_equal @lego_minifigure_everything.to_s, 
      "A Lego minifigure named Mr. Burns, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the left hand and is holding a 5 gram beer in the right hand."
  end

  def test_is_stylish?
    refute @lego_minifigure_nothing.is_stylish?
    assert @lego_minifigure_hat.is_stylish?

    ugly_hat = LegoHat.new(4, "orange", "baseball cap")
    lego_minifigure_ugly_hat = LegoMinifigure.new("Ralph", ugly_hat)
    refute lego_minifigure_ugly_hat.is_stylish?
  end

  def test_swap_hands
    lego_minifigure_swap = @lego_minifigure_everything
    @lego_minifigure_everything.swap_hands
    assert_equal @lego_minifigure_everything.left_item, lego_minifigure_swap.right_item
    assert_equal @lego_minifigure_everything.right_item, lego_minifigure_swap.left_item
  end

  def test_wear_hat
    @lego_minifigure_nothing.wear_hat(@lego_hat)
    assert_equal @lego_minifigure_nothing.hat, @lego_minifigure_hat.hat
    @lego_minifigure_nothing.wear_hat(nil)
    refute_equal @lego_minifigure_nothing.hat, @lego_minifigure_hat.hat
  end

  def test_place_in_left_hand
    @lego_minifigure_nothing.place_in_left_hand(@lego_item)
    assert_equal @lego_minifigure_nothing.left_item, @lego_minifigure_leftitem.left_item
    @lego_minifigure_nothing.place_in_left_hand(nil)
    refute_equal @lego_minifigure_nothing.left_item, @lego_minifigure_leftitem.left_item
  end

  def test_place_in_right_hand
    @lego_minifigure_nothing.place_in_right_hand(@lego_item)
    assert_equal @lego_minifigure_nothing.right_item, @lego_minifigure_rightitem.right_item
    @lego_minifigure_nothing.place_in_right_hand(nil)
    refute_equal @lego_minifigure_nothing.right_item, @lego_minifigure_rightitem.right_item
  end

  def test_is_strong?
    refute @lego_minifigure_nothing.is_strong?
    assert @lego_minifigure_leftitem.is_strong?
    assert @lego_minifigure_hat_rightitem.is_strong?
    assert @lego_minifigure_everything.is_strong?
  end
end