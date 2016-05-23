gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/guess'
require_relative '../lib/round'

class RoundTest < Minitest::Test

  def test_round_and_deck_contents
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    assert round.deck
  end

  def test_each_round_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_round_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    assert round.current_card
  end

  def test_recorded_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    assert_equal "Juneau", round.record_guess("Juneau").guess
  end

  def test_current_guess_count

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_correct_guess_feedback

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_how_many_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.number_correct
  end



  def test_guess_for_given_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    assert_equal "2", round.record_guess("2").guess
  end

  def test_how_many_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("Juneau")
    assert_equal 2, round.guesses.count
  end

  def test_incorrect_guess_feedback

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("shit")
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_cumulative_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_percent_correct_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("Juneau")
    assert_equal 50, round.percent_correct
  end


end
