require './lib/employee'

RSpec.describe Employee do
  context "it's an employee" do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})

    it "exists and has attributes" do
       expect(bobbi).to be_an(Employee)
       expect(bobbi.name).to eq("Bobbi Jaeger")
       expect(bobbi.age).to eq(30)
       expect(bobbi.salary).to eq(100000)
    end
  end
end
