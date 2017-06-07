require_relative './backtracker.rb'
require_relative './data_set.rb'

ds8 = DataSet.new("ds8.txt")
ds10 = DataSet.new("ds10.txt")
b8 = Backtracker.new(ds8)
b10 = Backtracker.new(ds10)

start = Time.now
b10.run
finish = Time.now
ds10_time = finish - start
puts "DS10 time = #{ds10_time}"

start = Time.now
b8.run
finish = Time.now
ds8_time = finish - start
puts "DS8 time = #{ds8_time}"

puts "DS10 time / DS8 time  =  #{ds10_time/ds8_time}"
