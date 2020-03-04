class Employee

  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name

    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(mult)
    emp_bonus = (@salary) * mult
  end
end



class Manager < Employee

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(mult)
    boss_bonus = (@employees.map{|emp| emp.salary}.sum) * mult
  end

  
  
end


emp1 = Employee.new("Javier", "engineer", 200000, "Pedro")
emp2 = Employee.new("Joe", "engineer", 200000, "Pedro")
emp3 = Employee.new("Jean", "engineer", 200000, "Pedro")
employees = [emp1, emp2, emp3]
man = Manager.new("Pedro", "engineer", 200000, "Pedro", employees)

p man.bonus(2)
p emp1.bonus(6)

