require './lib/department'
require './lib/employee'

RSpec.describe Department do
  context "it's a department" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})

    it "exists and has attributes" do
      expect(customer_service).to be_a(Department)
      expect(customer_service.name).to eq("Customer Service")
    end

    it "hires employess and adds them to employees array" do
      expect(customer_service.employees).to eq([])
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      expect(customer_service.employees).to eq([bobbi, aaron])
    end

    it "has expenses that start at 0 and increase with method expense" do
      expect(customer_service.expenses).to eq(0)
      customer_service.expense(100)
      customer_service.expense(25)
      expect(customer_service.expenses).to eq(125)
    end
  end
end
