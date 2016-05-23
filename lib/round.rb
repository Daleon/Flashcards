class Round
  attr_accessor :deck,
                :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    starting_cards = deck.cards.count
    card_counter = 0
    while deck.cards.count > 0
      card_counter = card_counter + 1
      puts "This is card number #{card_counter} out of #{starting_cards}."
      puts "Question: #{current_card.question}"
      input = gets.chomp
      puts record_guess(input).feedback
    end

    puts "****** Game Over! ******"
    puts "You had #{number_correct} correct guesses out of #{starting_cards} for as score of #{percent_correct}%"
  end

  def current_card
    deck.cards.first

  end

  def library_count
    deck.cards.count
  end



  def record_guess(guess)
    guess = Guess.new(guess, current_card)
    @guesses << guess
    deck.cards.shift
    guesses.last

  end

  def number_correct
    counter = 0
    guesses.each do |guess|
      if guess.correct?
        counter = counter + 1
      end

    end
    counter
  end

  def percent_correct
    number_correct / @guesses.count.to_f * 100
  end

end
