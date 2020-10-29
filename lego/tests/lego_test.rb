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
end