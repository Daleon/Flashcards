gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'

class CardTest < Minitest::Test
  def test_card_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end
end
