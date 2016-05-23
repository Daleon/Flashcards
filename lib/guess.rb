class Guess
  attr_reader :guess,
              :card,
              :answer

  def initialize(guess, card)
    @guess = guess
    @card  = card
  end

  def response
    @guess = guess
  end

  def correct?
    if card.answer == guess
      true
    else
      false
    end
  end

  def feedback
    if card.answer == guess
      "Correct!"
    else
      "Incorrect."
    end
  end
end
