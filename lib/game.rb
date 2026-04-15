require_relative "mastermind/computer_vs_player"
require_relative "mastermind/player_vs_computer"
require "colorize"

# Basic game controller and loop
class Game
  def start
    print "Please enter a keyword (type 'h' for keywords) -> ".colorize(:orange)
    keyword = gets.chomp.chars.first.downcase
    call_method(keyword)
    start if keyword != "e"
    puts "Thank you for playing!\n exiting...".colorize(:yellow)
  end

  def call_method(key)
    case key
    when "h"
      puts help
    when "p"
      game = PlayerVsComputer.new
      game.play
      game.end_game
    when "c"
      game = ComputerVsPlayer.new
      game.play
      game.end_game
    when "i"
      puts instructions
    end
  end

  def help
    "
    Keywords:
    - Help (h)
    - Player Creator (p)
    - Computer Creator (c)
    - Instructions (i)
    "
  end

  def instructions
    "
    How to use this program:
    - When guessing or setting a code you must pick 4 choicese and seperate
    them by a comma. You must also use the frist letter of the color like this:
    (r,b,g,o) == (🔴,🔵,🟢,🟠)
    - You will have 12 attempts to guess the correct code the computer chooses,
    or the computer will have 12 attempts to guess your code.
    - If the computer gives you an error saying your input was invalid
    put it in until it takes is but make sure you have the correct format."
  end
end
