class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    sum = 0
    employees.each do |emp|
      sum += emp.salary
    end
    sum * multiplier
  end
end
