require_relative './backtracker.rb'
require_relative './data_set.rb'

ds8 = DataSet.new("ds8.txt")
ds10 = DataSet.new("ds10.txt")
b8 = Backtracker.new(ds8)
b10 = Backtracker.new(ds10)

b10.run
b10.print_solution
b8.run
b8.print_solution
