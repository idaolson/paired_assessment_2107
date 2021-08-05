require './lib/department'
require './lib/employee'
require './lib/budget'

RSpec.describe Budget do
  context "it's a budget" do
    budget = Budget.new("2021")
    customer_service = Department.new("Customer Service")
    mail_room = Department.new("Mail Room")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})

    it "exists and has attributes" do
      expect(budget).to be_a(Budget)
      expect(budget.year).to eq("2021")
    end

    it "has an array of departments and can add departments" do
      expect(budget.departments).to eq([])
      add_department(customer_service)
      add_department(mail_room)
      expect(budget.departments).to eq([customer_service, mail_room])
    end

    it "can list departments with expenses less than $500" do
      customer_service.expense(505)
      mail_room.expense(120)
      expect(budget.minor_departments).to eq([mail_room])
    end

    it "can list all employee salaries" do
      expect(budget.all_employee_salaries).to eq([])
      mail_room.hire(bobbi)
      customer_service.hire(aaron)
      expect(budget.all_employee_salaries).to eq([100000, 90000])
    end
  end
end


# Each budget has a year, as well as a way to read that data
# 1. A budget can list all of its departments
# 1. A budget can list all departments with expenses less than $500
# 1. A budget can list all employees' salaries
#
# Build upon your code from the first two iterations to complete this task.
