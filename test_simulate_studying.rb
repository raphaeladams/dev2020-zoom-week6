# Practice Makes Perfect
# Raphael Adams

require 'minitest/autorun'
require_relative 'practice_makes_perfect'

class SimulateStudyingTest < Minitest::Test
  def test_simulate_studying

    assert_output(/so far: 1|so far: 2|so far: 5|so far: 9|so far: 14|math exam, took 5 sessions/) do
      simulate_studying("math") { |sesh_num| sesh_num < 3 ? 1 : sesh_num }
    end

    assert_output(/so far: 1|so far: 3|so far: 5|so far: 7|so far: 9|so far: 11|geography exam, took 6 sessions/) do
      simulate_studying("geography") { |sesh_num| [sesh_num, 2].min }
    end

  end
end