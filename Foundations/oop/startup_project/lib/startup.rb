require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees


  #salaries: {"title" => salary(number)}
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(other_startup)
    @funding > other_startup.funding
  end

  def hire(employee_name, title)
    if !valid_title?(title)
      raise StandardError.new "Invalid Title"
    end
      @employees << Employee.new(employee_name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    raise StandardError.new "Not enough Funding!!!" if salary > @funding

    @funding -= salary
    employee.pay(salary)
  end

  def payday
    @employees.each {|employee| pay_employee employee}
  end

  def average_salary
    sum = 0
    @employees.each do |employee|
      sum += @salaries[employee.title]
    end
    sum / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding

    other.salaries.each do |title, salary|
      if !@salaries[title]
        @salaries[title] = salary
      end
    end

    @employees = @employees + other.employees
    other.close
  end





end
