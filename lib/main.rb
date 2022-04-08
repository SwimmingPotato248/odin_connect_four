class ConnectFour
  def initialize
    @p1 = 'x'
    @p2 = "\u25cf"
    @game_board = Array.new(6) { Array.new(7, "\u25cb") }
    @turn = 0
  end
  
  def play_game
    winner = false
    while !winner
      @turn += 1
      display_board()
      display_turn_message()
      move = get_user_move()
      make_move(move)
      winner = check_winner()
      puts "**********"
    end

    display_winner()
    display_board()
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
    return false
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
    return false
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
    return false
  end

  def display_board
    @game_board.reverse.each do |row|
      puts row.join(' ')
    end
  end

  def display_turn_message
    current_player = current_player()
    puts "Make your move player #{current_player}"
  end

  def current_player
    (@turn % 2 == 0) ? @p1 : @p2
  end

  def get_user_move
    input = ""
    while !(input in (0..6))
      input = gets.chomp.to_i
    end
    return input
  end

  def make_move(move)
    @game_board.each do |row|
      if row[move] == "\u25cb"
        row[move] = current_player()
        break
      end
    end
  end

  def display_winner
    puts "#{current_player()} won"
  end
end

ConnectFour.new.play_game