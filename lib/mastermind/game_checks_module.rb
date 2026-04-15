require "colorize"
# Checks used by both PlayerVsComputer and ComputerVsPlayer classes.
module GameChecks
  def initialize
    @code_pool = ["🔴", "🔵", "🟡", "🟠", "🟣", "🟢"]
    @code = generate_answer
    @row = 0
    @board = Board.new
    @feedback = []
    set_players
  end

  def controller(guess)
    @feedback = check_answer(
      right_spot_right_color?(guess),
      right_color_wrong_spot?(guess)
    )
    @board.manage_board(@row, guess, @feedback)
    @row += 1
    play unless game_over?
  end

  def valid_input?(guess)
    valid_chars = %w[r b y o p g]
    guess.all? { |g| valid_chars.include?(g) && g.length == 1 } && guess.length == 4
  end

  def text_to_emoji(input)
    emojis = {
      r: "🔴",
      b: "🔵",
      y: "🟡",
      o: "🟠",
      p: "🟣",
      g: "🟢"
    }
    p input
    input.map { |item| emojis[item.to_sym] }
  end

  def check_answer(black, white)
    feedback = black
    (white.length - black.length).times do
      feedback.push("⚪")
    end
    feedback
  end

  def right_color_wrong_spot?(input)
    feedback = []
    code = @code.dup
    input.each do |item|
      feedback.push("⚪") && code[code.index(item)] = "-" if code.include?(item)
    end
    feedback
  end

  def right_spot_right_color?(input)
    feedback = []
    input.each_with_index { |item, idx| feedback.push("⚫") if item == @code[idx] }
    feedback
  end

  def game_over?
    true if correct_guess? || no_guesses_left?
  end

  def correct_guess?
    true if @feedback.length == 4 && @feedback.all?("⚫")
  end

  def no_guesses_left?
    true if @row >= 12
  end

  def end_game
    puts no_guesses_left? ? "#{@code_maker} won!".colorize(:yellow) : "#{@guesser} won!".colorize(:yellow)
  end
end
