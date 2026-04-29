require_relative "game_checks_module"
require_relative "board"
require "colorize"
# Computer creates secert code and players guesses
class ComputerVsPlayer
  include GameChecks

  def set_players
    @guesser = "You"
    @code_maker = "The Computer"
  end

  def generate_answer
    code = []
    4.times { code.push(@code_pool.sample) }
    code
  end

  def play
    controller(text_to_emoji(user_input))
  end

  def user_input(msg = "What is your guess for #{@row + 1} -> ", color = :blue)
    print msg.colorize(color)
    guess = gets.chomp.downcase.split(",")
    guess = user_input("Please separate your 4 choices by a comma. (r,b,y,o,p,g) -> ", :red) unless valid_input?(guess)
    guess
  end
end
