require 'connect-4'

describe ConnectFour do
  let (:newgame) do
    ConnectFour.new
  end

  describe '.display_board' do
    context 'When called at start' do
      it 'prints the starting game board' do
        6.times do
        expect(STDOUT).to receive(:puts).with('|   |   |   |   |   |   |   |')
        expect(STDOUT).to receive(:puts).with('-----------------------------')
        end
        newgame.display_board
      end
    end

    context 'When called after 1 turn' do
      it 'prints the players choices' do
        newgame.place_piece(0)
        expect(newgame.positions[5][0]).to eql '⚫'
      end
    end
  end

  describe 'place_piece' do
    context 'Selecting a place for your piece' do
      it 'saves it in an array and increments the turn' do
        newgame.place_piece(1)
        expect(newgame.turn).to eql(2)
      end
    end
    context 'Player 2 places a piece on top' do
      it 'aligns the pieces on top of another' do
        newgame.place_piece(1)
        newgame.place_piece(1)
        expect(newgame.turn).to eql(3)
        expect(newgame.positions[4][1]).to eql '⚪'
      end
    end
  end

  describe '.create_positions' do
    context 'On initialize' do
      it 'creates the empty positions array' do
        positions = newgame.create_positions
        expect(positions.length).to eql(6)
        expect(positions[0].length).to eql(7)
      end
    end
  end

  describe '.player_1_now?' do
    context 'Check if it\'s player 1 turn now' do
      it 'by returning true or false' do
        expect(newgame.player_1_now?).to eq true
      end
    end
  end

  describe '.switch_turn' do
    context 'Switches between player 1 and 2' do
      it 'and calls player_1_now to check' do
      newgame.switch_turn
      expect(newgame.player_1_now?).to eq false
      end
    end
  end
  describe '.input_to_pos' do
    context 'When you receive input from the user' do
      it 'turn into a int with correct position' do
        expect(newgame.input_to_pos('1')).to eql(0)
      end
    end
  end

  describe '.horizontal_win?' do
    context 'At the start of the game' do
      it 'returns false as nobody has put pieces' do
        expect(newgame.horizontal_win?).to eql false
      end
    end

    context 'If we have a horizontal 4' do
      it 'return true' do
        newgame.place_piece(0)
        newgame.place_piece(0)
        newgame.place_piece(1)
        newgame.place_piece(0)
        newgame.place_piece(2)
        newgame.place_piece(1)
        newgame.place_piece(3)
        expect(newgame.horizontal_win?).to eql true
      end
    end
  end

  describe '.vertical_win?' do
    context 'At the start of the game' do
      it 'returns false as nobody has put pieces' do
        expect(newgame.vertical_win?).to eql false
      end
    end

    context 'If we have a vertical 4' do
      it 'return true' do
        newgame.place_piece(0)
        newgame.place_piece(1)
        newgame.place_piece(0)
        newgame.place_piece(2)
        newgame.place_piece(0)
        newgame.place_piece(1)
        newgame.place_piece(0)
        expect(newgame.vertical_win?).to eql true
      end
    end
  end

  describe '.draw?' do
    context 'all turns have been played and nobody has won' do
      it 'returns true' do
        # this one is difficult to test
      end
    end
  end
end