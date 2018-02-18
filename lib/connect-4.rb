class ConnectFour
  attr_reader :turn, :positions
  def initialize
    @turn = 1
    @positions = create_positions
    @player_1 = true
    @black = '⚫'
    @white = '⚪'
  end

  def display_board
    @positions.each_index do |row|
      puts "| #{@positions[row][0]} | #{@positions[row][1]} | #{@positions[row][2]} " \
           "| #{@positions[row][3]} |" \
           " #{@positions[row][4]} | #{@positions[row][5]} | #{@positions[row][6]} |"
      puts '-----------------------------'
    end
  end

  def create_positions
    positions = Array.new(6) { Array.new(7, ' ') }
  end

  def place_piece(pos)
    current_row = 5
    if player_1_now?
      while current_row != 0
        if @positions[current_row][pos] == ' '
          @positions[current_row][pos] = @black
          break
        else
          current_row -= 1
        end
      end
    else
      while current_row != 0
        if @positions[current_row][pos] == ' '
          @positions[current_row][pos] = @white
          break
        else
          current_row -= 1
        end
      end
    end

    switch_turn
  end

  def player_1_now?
    @player_1
  end

  def input_to_pos(input)
    input.to_i - 1
  end

  def switch_turn
    @turn += 1
    @player_1 = if @player_1
                  false
                else
                  true
                end
  end

  def horizontal_win?
    symbol = !@player_1 ? @black : @white
    result = 0
    @positions.each do |row|
      row.each do |cell|
        if cell == symbol
          result += 1
          return true if result == 4
        else
          result = 0
        end
      end
    end
    false
  end

  def vertical_win?
    symbol = !@player_1 ? @black : @white
    result = 0
    (0..6).each do |col|
      (0..5).each do |row|
        if @positions[row][col] == symbol
          result += 1
          return true if result == 4
        else
          result = 0
        end
      end
    end
    false
  end

  def draw?
    if @turn > 42
      puts 'The game ends in a draw!'
      exit
    end
  end

  def play
    display_board
    while !horizontal_win? && !vertical_win?
      puts 'Choose a position! (1-7)'
      choice = gets.strip
      choice = input_to_pos(choice)
      place_piece(choice)
      display_board
      draw?
    end
    symbol = !@player_1 ? @black : @white
    puts "Player #{symbol} won!"

  end

end

# new_game = ConnectFour.new
# new_game.play
