class Manager < Employee

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end

end
