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
end
