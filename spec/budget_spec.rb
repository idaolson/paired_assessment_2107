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
      budget.add_department(customer_service)
      budget.add_department(mail_room)
      expect(budget.departments).to eq([customer_service, mail_room])
    end

    it "can list departments with expenses less than $500" do
      customer_service.expense(505)
      mail_room.expense(120)
      expect(budget.minor_departments).to eq([mail_room])
    end

    it "can list all employee salaries" do
      customer_service.hire(aaron)
      mail_room.hire(bobbi)
      expect(budget.all_employee_salaries).to eq([90000, 100000])
    end
  end
end
