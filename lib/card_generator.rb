require_relative '../lib/card'


class CardGenerator
  def initialize(card_bank)
    @deck = []
    f = File.open(card_bank, "r")
    file = f.read
    file.split("\n").each do |fil|
      fil = fil.split(",")
    @deck << Card.new(fil.first, fil.last)
    end
  end

  def something
    @deck
  end


  def count
    @deck.count
  end
end
