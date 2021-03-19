require 'battleship'
require 'board'

describe 'Battleship' do
  let(:battleship) { Battleship.new(10) }

  describe 'PART 3' do
    describe '#initialize' do
      it 'takes in a number, n, representing the length of the board' do
        battleship
      end

      it 'sets @player to a new Player instance' do
        expect(battleship.instance_variable_get(:@player)).to be_instance_of(Player)
      end

      it 'calls Board::new with the given length' do
        allow(Board).to receive(:new).and_return(double('board', size: 100))
        expect(Board).to receive(:new).with(10)
        battleship

        allow(Board).to receive(:new).and_return(double('board', size: 16))
        expect(Board).to receive(:new).with(4)
        Battleship.new(4)
      end

      it 'sets @board to a Board instance with size n * n' do
        board = battleship.instance_variable_get(:@board)
        expect(board).to be_an_instance_of(Board)
      end

      it 'sets @remaining_misses to half the size of the board' do
        expect(battleship.instance_variable_get(:@remaining_misses)).to eq(50)

        small_battleship = Battleship.new(4)
        expect(small_battleship.instance_variable_get(:@remaining_misses)).to eq(8)
      end
    end

    describe '#board' do
      it 'gets (return) @board' do
        expect(battleship.board).to be(battleship.instance_variable_get(:@board))
      end
    end

    describe '#player' do
      it 'gets (return) @player' do
        expect(battleship.player).to be(battleship.instance_variable_get(:@player))
      end
    end

    describe '#start_game' do
      it 'randomlies place ships on the @board' do
        expect(battleship.instance_variable_get(:@board)).to receive(:place_random_ships)
        battleship.start_game
      end

      it 'prints the number of ships placed on the @board' do
        expect { battleship.start_game }.to output(/25/).to_stdout
      end

      it 'prints the @board' do
        expect(battleship.board).to receive(:print)
        battleship.start_game
      end
    end

    describe '#lose?' do
      context 'when @remaining_misses is less than or equal to zero' do
        it "prints 'you lose'" do
          battleship.instance_variable_set(:@remaining_misses, -1)
          expect { battleship.lose? }.to output(/lose/).to_stdout
        end

        it 'returns true' do
          battleship.instance_variable_set(:@remaining_misses, -1)
          expect(battleship.lose?).to eq(true)

          battleship.instance_variable_set(:@remaining_misses, 0)
          expect(battleship.lose?).to eq(true)
        end
      end

      context 'when @remaining_misses is greater than zero' do
        it 'returns false' do
          battleship.instance_variable_set(:@remaining_misses, 5)
          expect(battleship.lose?).to eq(false)
        end
      end
    end

    describe '#win?' do
      it 'calls Board#num_ships on the @board' do
        allow(battleship.board).to receive(:num_ships).and_return(0)
        expect(battleship.board).to receive(:num_ships)
        battleship.win?
      end

      context 'when there are no ships left on the @board' do
        it "prints 'you win'" do
          allow(battleship.board).to receive(:num_ships).and_return(0)
          expect { battleship.win? }.to output(/win/).to_stdout
        end

        it 'returns true' do
          allow(battleship.board).to receive(:num_ships).and_return(0)
          expect(battleship.win?).to eq(true)
        end
      end

      context 'when there are remaining ships on the @board' do
        it 'returns false' do
          allow(battleship.board).to receive(:num_ships).and_return(4)
          expect(battleship.win?).to eq(false)
        end
      end
    end

    describe '#game_over?' do
      it 'returns true if the game has been won or lost' do
        allow(battleship).to receive(:lose?).and_return(false)
        allow(battleship).to receive(:win?).and_return(true)
        expect(battleship.game_over?).to eq(true)

        allow(battleship).to receive(:lose?).and_return(true)
        allow(battleship).to receive(:win?).and_return(false)
        expect(battleship.game_over?).to eq(true)

        allow(battleship).to receive(:lose?).and_return(true)
        allow(battleship).to receive(:win?).and_return(true)
        expect(battleship.game_over?).to eq(true)
      end

      it 'returns false if the game is not over' do
        battleship.start_game
        expect(battleship.game_over?).to eq(false)
      end
    end

    describe '#turn' do
      it 'gets a move from the @player' do
        allow(battleship.player).to receive(:get_move).and_return([4, 2])
        expect(battleship.player).to receive(:get_move)
        battleship.turn
      end

      it 'attacks the position specified by the @player' do
        allow(battleship.player).to receive(:get_move).and_return([4, 2])
        expect(battleship.board).to receive(:attack).with([4, 2])
        battleship.turn

        allow(battleship.player).to receive(:get_move).and_return([1, 1])
        expect(battleship.board).to receive(:attack).with([1, 1])
        battleship.turn
      end

      context 'when the attack is not successful' do
        it 'decrements @remaining_misses' do
          battleship.board[[4, 2]] = :N
          allow(battleship.player).to receive(:get_move).and_return([4, 2])

          battleship.turn
          expect(battleship.instance_variable_get(:@remaining_misses)).to eq(49)
        end
      end

      context 'when the attack is successful' do
        it 'does not decrement @remaining_misses' do
          battleship.board[[4, 2]] = :S
          allow(battleship.player).to receive(:get_move).and_return([4, 2])

          battleship.turn
          expect(battleship.instance_variable_get(:@remaining_misses)).to eq(50)
        end
      end

      it 'prints the @board' do
        allow(battleship.player).to receive(:get_move).and_return([4, 2])
        expect(battleship.board).to receive(:print)
        battleship.turn
      end

      it 'prints the new number of @remaining_misses' do
        allow(battleship.player).to receive(:get_move).and_return([4, 2])
        expect { battleship.turn }.to output(/49/).to_stdout
      end
    end
  end
end
