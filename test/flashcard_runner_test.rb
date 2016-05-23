gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/flashcard_runner'
require_relative '../lib/deck'
require_relative '../lib/round'


class FlashCardRunnerTest < Minitest::Test
  def test_intr_dialogue
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
                       reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
                       clockwise from due north?", "North north west")
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)
    assert_equal "Welcome! You're playing with 4 cards.", round.start
  end
end
