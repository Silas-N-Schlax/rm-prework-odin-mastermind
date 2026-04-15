# Generate, Update, Manage, and Send board.
class Board
  def initialize
    @board = Array.new(12) { Array.new(4, "  ") }
    @feedback = Array.new(12) { Array.new(4, "  ") }
  end

  def manage_board(row, guess, feedback)
    update_board(row, guess)
    update_feedback(row, feedback)
    send_board
  end

  def update_board(row, input)
    input.each_with_index { |item, index| @board[row][index] = item }
  end

  def update_feedback(row, feedback)
    feedback.each_with_index { |item, index| @feedback[row][index] = item }
  end

  def send_board
    puts generate_board
  end

  def generate_board
    board_ary = ["╔══════Guess══════╦╦═════Feedback════╗"]
    @board.each_with_index do |row, i|
      board_ary.push(
        [generate_row(row), generate_row(@feedback[i])].join
      )
      board_ary.push("╠═════════════════╬╬═════════════════╣")
    end
    board_ary.pop
    board_ary.push("╚═════════════════╩╩═════════════════╝")
    board_ary
  end

  def generate_row(row)
    "║ #{row[0]}  #{row[1]}  #{row[2]}  #{row[3]}  ║"
  end
end
