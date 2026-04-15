require_relative "game_checks_module"
require_relative "board"
require "colorize"
# Player creates secert code and computer guesses
class PlayerVsComputer
  include GameChecks

  def set_players
    @guesser = "The Computer"
    @code_maker = "You"
  end

  def generate_answer(msg = "What is your secert code? -> ", color = :blue)
    print msg.colorize(color)
    code = gets.chomp.downcase.split(",")
    msg = "Please seperate your 4 choices by a comma. (r,b,y,o,p,g) -> "
    code = generate_answer(msg, :red) unless valid_input?(code)
    text_to_emoji(code)
  end

  def play
    controller(computer_guess)
  end

  def computer_guess
    guess = []
    4.times { guess.push(@code_pool.sample) }
    guess
  end
end
