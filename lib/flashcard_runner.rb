require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/guess'
require_relative '../lib/round'
require_relative '../lib/card_generator'





card_generator = CardGenerator.new("cards.txt")
deck   = Deck.new(card_generator.something)
round  = Round.new(deck)
round.start
