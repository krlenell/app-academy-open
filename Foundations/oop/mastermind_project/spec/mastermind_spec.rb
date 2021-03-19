require 'mastermind'

describe 'Mastermind' do
  let(:mastermind) do
    mastermind = Mastermind.new(4)
    mastermind.instance_variable_set(:@secret_code, Code.new(%w[R G R B]))
    mastermind
  end

  describe 'PART 3' do
    describe '#initialize' do
      it 'accepts a length (number) as an arg' do
        mastermind
      end

      it 'sets @secret_code to a random Code instance of the given length' do
        allow(Code).to receive(:random).and_return(Code.new(%w[R G R B]))
        expect(Code).to receive(:random).with(4)
        expect(Mastermind.new(4).instance_variable_get(:@secret_code)).to be_instance_of(Code)

        allow(Code).to receive(:random).and_return(Code.new(%w[R G R B Y]))
        expect(Code).to receive(:random).with(5)
        expect(Mastermind.new(5).instance_variable_get(:@secret_code)).to be_instance_of(Code)
      end
    end

    describe '#print_matches' do
      it 'accepts a Code instance as an arg' do
        mastermind.print_matches(Code.new(%w[R Y G B]))
      end

      it 'prints the number of exact matches between @secret_code and the arg' do
        code = Code.new(%w[R Y Y B])
        expect { mastermind.print_matches(code) }.to output(/2/).to_stdout
      end

      it 'prints the number of near matches between @secret_code and the arg' do
        code = Code.new(%w[Y Y Y G])
        expect { mastermind.print_matches(code) }.to output(/1/).to_stdout
      end
    end

    describe '#ask_user_for_guess' do
      it "prints 'Enter a code'" do
        allow(mastermind).to receive(:gets).and_return("RGRB\n")

        expect { mastermind.ask_user_for_guess }.to output(/Enter a code/).to_stdout
      end

      it 'calls gets.chomp to get input from the user' do
        input = double("RGRB\n", chomp: 'RGRB')
        allow(mastermind).to receive(:gets).and_return(input)

        expect(input).to receive(:chomp)
        expect(mastermind).to receive(:gets)
        mastermind.ask_user_for_guess
      end

      it "calls Code::from_string with the user's entered string" do
        input = double("RGRB\n", chomp: 'RGRB')
        allow(mastermind).to receive(:gets).and_return(input)
        allow(Code).to receive(:from_string).and_return(Code.new(%w[R G R B]))

        expect(Code).to receive(:from_string).with('RGRB')
        mastermind.ask_user_for_guess
      end

      it "prints the number of exact and near matches between @secret_code and the user's guessed code" do
        input = double("RYYB\n", chomp: 'RYYB')
        allow(mastermind).to receive(:gets).and_return(input)
        expect { mastermind.ask_user_for_guess }.to output(/2/).to_stdout
        expect { mastermind.ask_user_for_guess }.to output(/0/).to_stdout
      end

      it "returns a boolean indicating whether the user's guessed code is equal to @secret_code" do
        input_1 = double("RGRB\n", chomp: 'RGRB')
        allow(mastermind).to receive(:gets).and_return(input_1)
        expect(mastermind.ask_user_for_guess).to eq(true)

        input_2 = double("YYYY\n", chomp: 'YYYY')
        allow(mastermind).to receive(:gets).and_return(input_2)
        expect(mastermind.ask_user_for_guess).to eq(false)
      end
    end
  end
end
