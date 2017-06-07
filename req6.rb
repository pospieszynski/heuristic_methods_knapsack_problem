require_relative './neighbor_search.rb'
require_relative './backtracker.rb'
require_relative './data_set.rb'

ds8 = DataSet.new("ds8.txt")
ds10 = DataSet.new("ds10.txt")
ds50 = DataSet.new("ds50.txt")
ds100 = DataSet.new("ds100.txt")

ns8 = NeighborSearch.new(ds8)
ns10 = NeighborSearch.new(ds10)
ns50 = NeighborSearch.new(ds50)
ns100 = NeighborSearch.new(ds100)

b8 = Backtracker.new(ds8)
b10 = Backtracker.new(ds10)

start = Time.now
b10.run
finish = Time.now
ds10_b_time = finish - start

start = Time.now
b8.run
finish = Time.now
ds8_b_time = finish - start

start = Time.now
ns10.run
finish = Time.now
ds10_time = finish - start
puts "DS10 time = #{ds10_time}"

start = Time.now
ns8.run
finish = Time.now
ds8_time = finish - start
puts "DS8 time = #{ds8_time}"

puts "DS10 time / DS8 time  =  #{ds10_time/ds8_time}\n"

start = Time.now
ns50.run
finish = Time.now
ds50_time = finish - start
puts "DS50 time = #{ds50_time}"

start = Time.now
ns100.run
finish = Time.now
ds100_time = finish - start

puts "DS100 time = #{ds100_time}"

puts "DS50 time / DS100 time  =  #{ds50_time/ds100_time}"

puts "DS8 backtrack time / DS8 neighbor time  =  #{ds8_b_time/ds8_time}"

puts "DS10 backtrack time / DS10 neighbor time  =  #{ds10_b_time/ds10_time}"
