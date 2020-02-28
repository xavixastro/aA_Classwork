require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if @salaries[title] 
            return true
        else
            return false
        end
    end

    def >(startupx)
        self.funding > startupx.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise "Invalid title" 
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if self.funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary

        total = @employees.inject(0) do |acc, employee|
            acc+@salaries[employee.title]            
        end

        total/@employees.length
    end

    def close
        @employees=[]
        @funding=0
    end

    def acquire(startupx)
        @funding += startupx.funding
        startupx.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k]=v
            end
        end

        @employees+=startupx.employees

        startupx.close
    end
end
