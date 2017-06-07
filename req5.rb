require_relative './neighbor_search.rb'
require_relative './data_set.rb'

ds8 = DataSet.new("ds8.txt")
ds10 = DataSet.new("ds10.txt")
ds50 = DataSet.new("ds50.txt")
ds100 = DataSet.new("ds100.txt")

ns8 = NeighborSearch.new(ds8)
ns10 = NeighborSearch.new(ds10)
ns50 = NeighborSearch.new(ds50)
ns100 = NeighborSearch.new(ds100)

ns8.run
ns8.print_solution

ns10.run
ns10.print_solution

ns50.run
ns50.print_solution

ns100.run
ns100.print_solution
