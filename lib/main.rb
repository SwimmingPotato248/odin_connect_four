class ConnectFour
  def initialize
    @p1 = 'x'
    @p2 = "\u25cf"
    @game_board = Array.new(6) { Array.new(7, "\u25cb") }
    @turn = 0
  end
  
  def play_game
    while !check_winner()
      display_board()
      display_turn_message()
      get_user_move()
    end

    display_winner()
  end

  def check_winner
    if check_row() || check_column() || check_diagonal()
      return true
    end
  end

  def check_row
    @game_board.each do |row|
      4.times do |e|
        if row[e..e + 3].uniq.size == 1 && row[e] != "\u25cb"
          return true
        end
      end
    end
  end

  def check_column
    7.times do |column|
      column_array = []
      6.times do |row|
        column_array << @game_board[row][column]
      end

      3.times do |e|
        if column_array[e..e + 3].uniq.size == 1 && column_array[e] != "\u25cb"
          return true
        end
      end
    end
  end

  def check_diagonal
    3.times do |row|
      4.times do |n|
        if @game_board[row][n] == @game_board[row + 1][n + 1] && @game_board[row][n] == @game_board[row + 2][n + 2] && @game_board[row][n] == @game_board[row + 3][n + 3] && @game_board[row][n] != "\u25cb"
          return true
        elsif @game_board[row][-n] == @game_board[row + 1][-n - 1] && @game_board[row][-n] == @game_board[row + 2][-n - 2] && @game_board[row][-n] == @game_board[row + 3][-n - 3] && @game_board[row][-n] != "\u25cb"
          return true
        end
      end
    end
  end
end

ConnectFour.new.play_game