gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_create_card
    cards = CardGenerator.new("cards.txt")
    assert_equal 4, cards.count
  end
end
