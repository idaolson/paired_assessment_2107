class Budget
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def minor_departments
    @departments.find_all do |department|
      department if department.expenses < 500
    end
  end

  def all_employee_salaries
    all_salaries = []
    @departments.each do |department|
      department.employees.each do |employee|
        all_salaries << employee.salary.to_i
      end
    end
    all_salaries
  end
end
