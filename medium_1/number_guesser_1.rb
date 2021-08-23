class Player
  attr_accessor :number_of_guesses, :number

  def initialize
    @number_of_guesses = 7
    @number = 0
  end

  def decrement_guesses
    self.number_of_guesses -= 1
  end
end

class UnknownNumber
  attr_reader :unknown, :min_range, :max_range

  def initialize(min, max)
    @min_range = min
    @max_range = max
    @unknown = (min..max).to_a.shuffle.pop
  end
end

class GuessingGame
  attr_accessor :player
  attr_reader :number

  def initialize
    @player = Player.new
    @number = nil
  end

  def display_number_of_guesses
    puts "You have #{player.number_of_guesses} guesses remaining."
  end

  def validate_number
    guess = 0
    loop do
      print "Enter a number between #{number.min_range} to #{number.max_range}: "
      guess = gets.chomp.to_i
      break if guess >= number.min_range && guess <= number.max_range
      print "Invalid guess. "
    end
    guess
  end

  def win_or_lose?
    if player.number_of_guesses > 0
      puts "You Won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def no_more_guesses
    player.number_of_guesses == 0
  end

  def guess_is_correct
    player.number == number.unknown
  end

  def compare_two_numbers
    if player.number > number.unknown
      puts "Your guess is too high."
    elsif player.number < number.unknown
      puts "Your guess is too low"
    end
  end

  def play
    @number = UnknownNumber.new(1, 100)
    loop do
      display_number_of_guesses
      player.number = validate_number
      compare_two_numbers
      puts ""
      player.decrement_guesses
      break if guess_is_correct || no_more_guesses
    end
    
    win_or_lose?
  end
end

game = GuessingGame.new
game.play