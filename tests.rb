# Test the Teacher
# Raphael Adams

require 'minitest/autorun'

# Gail's code wasn't in a function, so I've included it below in a
# function for easier testing. Therefore, this file doesn't need to
# require_relative 'day04'

def validate_phrases(input)
  passphrases = input.split("\n")

  numValid = 0
  numValidAnagram = 0

  passphrases.each do |phrase|
    words = phrase.split(" ")
    words.sort!

    sortedWords = Array.new(words)
    sortedWords.each_with_index do |word, index|
      sortedWords[index] = sortedWords[index].chars.sort.join
      puts sortedWords, "\n"
    end

    sortedWords.sort!


    ####
    # Part 1 of problem checks for duplicate words

    numValid += 1 # assume valid until proven otherwise
    words.each_with_index do |word, index|
      break if index == words.length-1
      if word == words[index + 1]
        numValid -= 1
        break
      end
    end


    ####
    # Part 2 of problem checks for duplicate anagrams
    numValidAnagram += 1 # assume valid until proven otherwise
    sortedWords.each_with_index do |word, index|
      break if index == sortedWords.length-1
      if word == sortedWords[index + 1]
        numValidAnagram -= 1
        break
      end
    end
  end

  puts "#{numValid} phrases are valid"
  puts "#{numValidAnagram} phrases are valid for anagrams"
end


class TestTheTeacher < Minitest::Test
  def test_duplicate_words
    assert_output(/1 phrases are valid\n/) { validate_phrases("aa bb cc dd ee") }
    assert_output(/0 phrases are valid\n/) { validate_phrases("aa bb cc dd aa") }
    assert_output(/1 phrases are valid\n/) { validate_phrases("aa bb cc dd aaa") }
    assert_output(/1 phrases are valid\n/) { validate_phrases("aa") }
    assert_output(/0 phrases are valid\n/) { validate_phrases("a a a") }
    assert_output(/0 phrases are valid\n/) { validate_phrases(" a a a") }
    assert_output(/1 phrases are valid\n/) { validate_phrases(" a b c") }
    assert_output(/0 phrases are valid\n/) { validate_phrases("") }
    assert_output(/0 phrases are valid\n/) { validate_phrases(" ") }
    assert_output(/0 phrases are valid\n/) { validate_phrases("  ") }
    assert_output(/0 phrases are valid\n/) { validate_phrases("aa  aa") }
    assert_output(/1 phrases are valid\n/) { validate_phrases("aa  bb") }
  end

  def test_anagrams
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases("abcde fghij") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("abcde xyz ecdab") }
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases("a ab abc abd abf abj") }
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases("iiii oiii ooii oooi oooo") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("oiii ioii iioi iiio") }
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases("abcde") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("abcde abcde") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("a a") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("a a a") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases(" a a a") }
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases(" a b c") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases(" ") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("  ") }
    assert_output(/0 phrases are valid for anagrams/) { validate_phrases("ab  ba") }
    assert_output(/1 phrases are valid for anagrams/) { validate_phrases("aa bb") }
  end
end