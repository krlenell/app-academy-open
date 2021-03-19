require 'startup'
require 'employee'

describe 'Startup' do
  let(:startup_1) do
    salaries = {
      'CEO' => 5000,
      'CTO' => 4200,
      'Software Engineer' => 3000,
      'Junior Developer' => 2400
    }

    Startup.new('Mystry Machinr', 22_000, salaries)
  end

  let(:startup_2) do
    salaries = {
      'CEO' => 4800,
      'CTO' => 3800,
      'Pilot' => 2500
    }

    Startup.new('Planet Express', 30_000, salaries)
  end

  describe 'PART 2' do
    describe '#initialize' do
      it 'accepts as args: name (string), funding (number), and salaries (hash) containing `title` => `salary` pairs' do
        startup_1
      end

      it 'sets @name, @funding, and @salaries with their respective args' do
        expect(startup_1.instance_variable_get(:@name)).to eq('Mystry Machinr')
        expect(startup_1.instance_variable_get(:@funding)).to eq(22_000)

        expected_titles = {
          'CEO' => 5000,
          'CTO' => 4200,
          'Software Engineer' => 3000,
          'Junior Developer' => 2400
        }
        expect(startup_1.instance_variable_get(:@salaries)).to eq(expected_titles)
      end

      it 'sets @employees to an empty array' do
        expect(startup_1.instance_variable_get(:@employees)).to eq([])
      end
    end

    describe '#name' do
      it 'gets (return) @name' do
        expect(startup_1.name).to be(startup_1.instance_variable_get(:@name))
      end
    end

    describe '#funding' do
      it 'gets (return) @funding' do
        expect(startup_1.funding).to be(startup_1.instance_variable_get(:@funding))
      end
    end

    describe '#salaries' do
      it 'gets (return) @salaries' do
        expect(startup_1.salaries).to be(startup_1.instance_variable_get(:@salaries))
      end
    end

    describe '#employees' do
      it 'gets (return) @employees' do
        expect(startup_1.employees).to be(startup_1.instance_variable_get(:@employees))
      end
    end

    describe '#valid_title?' do
      it 'takes in a title (string) as an arg' do
        startup_1.valid_title?('CTO')
      end

      context "when the given title exists in the startup's @salaries" do
        it 'returns true' do
          expect(startup_1.valid_title?('CTO')).to eq(true)
          expect(startup_1.valid_title?('Software Engineer')).to eq(true)
        end
      end

      context 'when the given title does not exist in the @salaries' do
        it 'returns false' do
          expect(startup_1.valid_title?('Programmer')).to eq(false)
          expect(startup_1.valid_title?('Designer')).to eq(false)
        end
      end
    end

    describe('#>') do
      it 'accepts another startup as an arg' do
        startup_2 > startup_1
      end

      context 'when our startup (self) has more funding than the arg' do
        it 'returns true' do
          expect(startup_2 > startup_1).to eq(true)
        end
      end

      context 'when our startup (self) does not have more funding than the arg' do
        it 'returns false' do
          expect(startup_1 > startup_2).to eq(false)
        end
      end
    end

    describe '#hire' do
      it 'takes in a employee_name (string) and title (string)' do
        startup_1.hire('Scooby', 'CEO')
      end

      context 'when the title is invalid' do
        it 'raises an error' do
          expect { startup_1.hire('Scooby', 'Designer') }.to raise_error
        end

        it 'does not add to @employees' do
          expect { startup_1.hire('Scooby', 'Designer') }.to raise_error
          expect(startup_1.employees).to eq([])
        end
      end

      context 'when the title is valid' do
        it 'creates a new Employee with the given args' do
          expect(Employee).to receive(:new).with('Scooby', 'CEO')
          startup_1.hire('Scooby', 'CEO')
        end

        it 'adds the new Employee instance to @employees' do
          startup_1.hire('Scooby', 'CEO')
          employee = startup_1.employees[0]
          expect(employee).to be_a(Employee)
          expect(employee).to have_attributes(name: 'Scooby', title: 'CEO')
        end
      end
    end

    describe '#size' do
      it 'returns the number of @employees' do
        expect(startup_1.size).to eq(0)

        startup_1.hire('Scooby', 'CEO')
        startup_1.hire('Velma', 'CTO')
        expect(startup_1.size).to eq(2)
      end
    end

    describe '#pay_employee' do
      it 'accepts an Employee instance as an arg' do
        startup_1.pay_employee(Employee.new('Scooby', 'CEO'))
      end

      context 'when the startup has enough funding to pay the employee' do
        it 'calls Employee#pay with the salary that corresponds with their title' do
          employee = Employee.new('Scooby', 'CEO')
          expect(employee).to receive(:pay).with(5000)
          startup_1.pay_employee(employee)
        end

        it "reduces the startup's @funding by the amount payed" do
          startup_1.pay_employee(Employee.new('Scooby', 'CEO'))
          expect(startup_1.funding).to eq(17_000)
        end
      end

      context 'when the startup does not have enough funding to pay the employee' do
        it 'raises an error' do
          employee = Employee.new('Scooby', 'CEO')
          4.times { startup_1.pay_employee(employee) }
          expect { startup_1.pay_employee(employee) }.to raise_error
        end

        it 'does not call Employee#pay' do
          employee = Employee.new('Scooby', 'CEO')
          4.times { startup_1.pay_employee(employee) }
          expect(employee).not_to receive(:pay)
          expect { startup_1.pay_employee(employee) }.to raise_error
        end

        it "does not reduce the startup's @funding" do
          employee = Employee.new('Scooby', 'CEO')
          4.times { startup_1.pay_employee(employee) }
          expect(startup_1.funding).to eq(2000)
          expect { startup_1.pay_employee(employee) }.to raise_error
          expect(startup_1.funding).to eq(2000)
        end
      end
    end

    describe '#payday' do
      it 'calls #pay_employee for each employee' do
        startup_1.hire('Scooby', 'CEO')
        startup_1.hire('Velma', 'CTO')
        startup_1.hire('Daphne', 'Software Engineer')
        startup_1.hire('Fred', 'Software Engineer')
        startup_1.employees.each { |employee| expect(startup_1).to receive(:pay_employee).with(employee) }
        startup_1.payday
      end
    end
  end

  describe 'PART 3' do
    describe '#average_salary' do
      it 'returns a number representing the average employee salary' do
        startup_1.hire('Scooby', 'CEO')
        startup_1.hire('Velma', 'CTO')
        startup_1.hire('Daphne', 'Software Engineer')
        startup_1.hire('Fred', 'Software Engineer')
        expect(startup_1.average_salary).to eq(3800)
      end
    end

    describe '#close' do
      it 'sets @employees to an empty array' do
        startup_1.hire('Scooby', 'CEO')
        startup_1.hire('Velma', 'CTO')
        startup_1.close
        expect(startup_1.employees).to be_empty
      end

      it 'sets @funding to 0' do
        startup_1.close
        expect(startup_1.funding).to eq(0)
      end
    end

    describe '#acquire' do
      it 'accepts another startup as an arg' do
        startup_1.acquire(startup_2)
      end

      it "adds the given startup's funding to our @funding" do
        startup_1.acquire(startup_2)
        expect(startup_1.funding).to eq(52_000)
      end

      it "adds the given startup's salaries to our @salaries, without overwriting any of our existing @salaries" do
        startup_1.acquire(startup_2)

        expected_salaries = {
          'CEO' => 5000,
          'CTO' => 4200,
          'Software Engineer' => 3000,
          'Junior Developer' => 2400,
          'Pilot' => 2500
        }

        expect(startup_1.salaries).to eq(expected_salaries)
      end

      it "adds the given startup's employees to our @employees" do
        startup_1.hire('Scooby', 'CEO')
        startup_2.hire('Professor Farnsworth', 'CEO')
        startup_2.hire('Fry', 'Pilot')
        combined_employees = startup_1.employees + startup_2.employees
        startup_1.acquire(startup_2)
        expect(startup_1.employees).to include(*combined_employees)
      end

      it 'calls Startup#close on the given startup' do
        expect(startup_2).to receive(:close)
        startup_1.acquire(startup_2)
      end
    end
  end
end
