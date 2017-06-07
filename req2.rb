File.open('./datasets/ds8.txt', 'w') do |f|
  f.write("#{(8*1.5).to_i}\n")
  8.times do |i|
    f.write("#{i+1}:#{rand(1..100)}\n")
  end
end

File.open('./datasets/ds10.txt', 'w') do |f|
  f.write("#{(10*1.5).to_i}\n")
  10.times do |i|
    f.write("#{i+1}:#{rand(1..100)}\n")
  end
end

File.open('./datasets/ds50.txt', 'w') do |f|
  f.write("#{(50*1.5).to_i}\n")
  50.times do |i|
    f.write("#{i+1}:#{rand(1..100)}\n")
  end
end

File.open('./datasets/ds100.txt', 'w') do |f|
  f.write("#{(100*1.5).to_i}\n")
  100.times do |i|
    f.write("#{i+1}:#{rand(1..100)}\n")
  end
end
