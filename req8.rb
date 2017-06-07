require_relative "./genetic_algorithm.rb"
require_relative "./data_set.rb"

ds8 = DataSet.new("ds8.txt")
ds10 = DataSet.new("ds10.txt")
ds50 = DataSet.new("ds50.txt")
ds100 = DataSet.new("ds100.txt")

ga8 = GeneticAlgorithm.new(ds8, 50, 10, 75, 5)
ga10 = GeneticAlgorithm.new(ds10, 50, 10, 75, 5)
ga50 = GeneticAlgorithm.new(ds50, 50, 10, 75, 5)
ga100 = GeneticAlgorithm.new(ds100, 50, 10, 75, 15)

ga8.run
ga10.run
ga50.run
ga100.run


