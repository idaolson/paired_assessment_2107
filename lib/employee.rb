class Employee
  attr_reader :name, :age, :salary

  def initialize(params)
    @name = params[:name]
    @age = params[:age].to_i
    @salary = params[:salary].to_i
  end
end
