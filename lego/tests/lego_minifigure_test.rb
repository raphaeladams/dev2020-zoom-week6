# Lego Tests
# Raphael Adams

require 'minitest/autorun'
require_relative '../lego'


class LegoMinifigureTest < Minitest::Test
  def setup
    @lego_hat = LegoHat.new(4, "red", "baseball cap")
    @lego_item_heavy = LegoItem.new("coffee", 11)
    @lego_item_light = LegoItem.new("beer", 10)

    @lego_minifigure_nothing = LegoMinifigure.new("Homer")
    @lego_minifigure_hat = LegoMinifigure.new("Marge", @lego_hat)

    @lego_minifigure_leftitem_heavy = LegoMinifigure.new("Bart", nil, @lego_item_heavy)
    @lego_minifigure_leftitem_light = LegoMinifigure.new("Bart", nil, @lego_item_light)

    @lego_minifigure_rightitem_heavy = LegoMinifigure.new("Lisa", nil, nil, @lego_item_heavy)
    @lego_minifigure_rightitem_light = LegoMinifigure.new("Lisa", nil, nil, @lego_item_light)

    @lego_minifigure_hat_leftitem_heavy = LegoMinifigure.new("Ned", @lego_hat, @lego_item_heavy)
    @lego_minifigure_hat_rightitem_heavy = LegoMinifigure.new("Krusty", @lego_hat, nil, @lego_item_heavy)
    
    @lego_minifigure_leftitem_heavy_rightitem_light = LegoMinifigure.new("Bob", nil, @lego_item_heavy, @lego_item_light)
    
    @lego_minifigure_everything_one_heavy_one_light = LegoMinifigure.new("Mr. Burns", @lego_hat, @lego_item_heavy, @lego_item_light)
    @lego_minifigure_everything_all_light = LegoMinifigure.new("Mr. Burns", @lego_hat, @lego_item_light, @lego_item_light)
    @lego_minifigure_everything_all_heavy = LegoMinifigure.new("Mr. Burns", @lego_hat, @lego_item_heavy, @lego_item_heavy)
  end

  def test_to_s_no_hat_or_items
    assert_equal @lego_minifigure_nothing.to_s, 
      "A Lego minifigure named Homer."
  end

  def test_to_s_hat_but_no_items
    assert_equal @lego_minifigure_hat.to_s, 
      "A Lego minifigure named Marge, who is wearing a 4 red baseball cap."
  end

  def test_to_s_just_left_hand
    assert_equal @lego_minifigure_leftitem_heavy.to_s, 
      "A Lego minifigure named Bart, who is holding a 11 gram coffee in the left hand."
  end

  def test_to_s_just_right_hand
    assert_equal @lego_minifigure_rightitem_heavy.to_s, 
      "A Lego minifigure named Lisa, who is holding a 11 gram coffee in the right hand."
  end

  def test_to_s_hat_and_left_item
    assert_equal @lego_minifigure_hat_leftitem_heavy.to_s, 
      "A Lego minifigure named Ned, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the left hand."
  end

  def test_to_s_hat_and_right_item
    assert_equal @lego_minifigure_hat_rightitem_heavy.to_s, 
      "A Lego minifigure named Krusty, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the right hand."
  end

  def test_to_s_no_hat_both_items
    assert_equal @lego_minifigure_leftitem_heavy_rightitem_light.to_s, 
      "A Lego minifigure named Bob, who is holding a 11 gram coffee in the left hand and is holding a 10 gram beer in the right hand."
  end

  def test_to_s_hat_and_both_items
    assert_equal @lego_minifigure_everything_one_heavy_one_light.to_s, 
      "A Lego minifigure named Mr. Burns, who is wearing a 4 red baseball cap and is holding a 11 gram coffee in the left hand and is holding a 10 gram beer in the right hand."
  end


  def test_is_stylish_no_hat
    refute @lego_minifigure_nothing.is_stylish?
  end

  def test_is_stylish_red_hat
    assert @lego_minifigure_hat.is_stylish?
  end

  def test_is_stylish_blue_hat
    blue_hat = LegoHat.new(4, "blue", "baseball cap")
    lego_minifigure_blue_hat = LegoMinifigure.new("Moe", blue_hat)
    assert lego_minifigure_blue_hat.is_stylish?
  end

  def test_is_stylish_hat_not_red_or_blue
    ugly_hat = LegoHat.new(4, "orange", "baseball cap")
    lego_minifigure_ugly_hat = LegoMinifigure.new("Ralph", ugly_hat)
    refute lego_minifigure_ugly_hat.is_stylish?
  end


  def test_swap_hands
    lego_minifigure_swap = @lego_minifigure_everything_one_heavy_one_light
    @lego_minifigure_everything_one_heavy_one_light.swap_hands
    assert_equal @lego_minifigure_everything_one_heavy_one_light.left_item, lego_minifigure_swap.right_item
    assert_equal @lego_minifigure_everything_one_heavy_one_light.right_item, lego_minifigure_swap.left_item
  end


  def test_wear_hat
    @lego_minifigure_nothing.wear_hat(@lego_hat)
    assert_equal @lego_minifigure_nothing.hat, @lego_minifigure_hat.hat
  end

  def test_wear_hat_put_nil_on_head
    @lego_minifigure_everything_one_heavy_one_light.wear_hat(nil)
    assert_equal @lego_minifigure_everything_one_heavy_one_light.hat, @lego_minifigure_nothing.hat
  end


  def test_place_item_in_left_hand
    @lego_minifigure_nothing.place_in_left_hand(@lego_item_heavy)
    assert_equal @lego_minifigure_nothing.left_item, @lego_minifigure_leftitem_heavy.left_item
  end

  def test_place_nil_in_left_hand
    @lego_minifigure_everything_one_heavy_one_light.place_in_left_hand(nil)
    assert_equal @lego_minifigure_everything_one_heavy_one_light.left_item, @lego_minifigure_nothing.left_item
  end

  def test_place_item_in_right_hand
    @lego_minifigure_nothing.place_in_right_hand(@lego_item_heavy)
    assert_equal @lego_minifigure_nothing.right_item, @lego_minifigure_rightitem_heavy.right_item
  end

  def test_place_nil_in_right_hand
    @lego_minifigure_everything_one_heavy_one_light.place_in_right_hand(nil)
    assert_equal @lego_minifigure_everything_one_heavy_one_light.right_item, @lego_minifigure_nothing.right_item
  end


  def test_is_strong_no_items
    refute @lego_minifigure_nothing.is_strong?
  end


  def test_is_strong_heavy_item_left_hand
    assert @lego_minifigure_leftitem_heavy.is_strong?
  end

  def test_is_strong_heavy_item_right_hand
    assert @lego_minifigure_rightitem_heavy.is_strong?
  end

  def test_is_strong_heavy_item_both_hands
    assert @lego_minifigure_everything_all_heavy.is_strong?
  end


  def test_is_strong_light_item_left_hand
    refute @lego_minifigure_leftitem_light.is_strong?
  end

  def test_is_strong_light_item_right_hand
    refute @lego_minifigure_rightitem_light.is_strong?
  end

  def test_is_strong_light_item_both_hands
    refute @lego_minifigure_everything_all_light.is_strong?
  end


  def test_is_strong_both_hands_full_one_heavy_item
    assert @lego_minifigure_everything_one_heavy_one_light.is_strong?
  end
end
