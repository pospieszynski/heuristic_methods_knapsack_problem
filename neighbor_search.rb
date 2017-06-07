class NeighborSearch
  attr_accessor :data_set, :solution

  def initialize(dataset)
    @data_set = dataset
    @solution = Array.new(dataset.n, 0)
    @data_set.n.times do |i|
      if( rand(0..1) == 1 && dataset.w[i] + get_total_weight(@solution) <= @data_set.g)
        @solution[i] = 1
      end
    end
  end

  def run
    tmp = []
    while (true) do
      break if (get_total_value(tmp) == get_total_value(solution) && !tmp.empty?)
      tmp = [].concat(@solution)
      #p "Solution: " + tmp.inspect
      data_set.n.times do |i|
        candidate = [].concat(tmp)
        if (tmp[i] == 1)
          candidate[i] = 0
          j = i+1
          while (!data_set.w[j].nil? && get_total_weight(candidate) + data_set.w[j] <= data_set.g && j != data_set.n)
            candidate[j] = 1
            j += 1
          end
          #p "candidate: " + candidate.inspect
          if (get_total_value(candidate) > get_total_value(solution))
            solution = [].concat(candidate)
          end
        end
      end
    end
  end

  def get_total_weight(weights)
    sum = 0
    weights.each_with_index do |item, index|
      sum += item * data_set.w[index]
    end
    sum
  end

  def get_total_value(values)
    return 0 if (get_total_weight(values) > data_set.g)
    sum = 0
    values.each_with_index do |item, index|
      sum += item * data_set.v[index]
    end
    sum
  end

  def print_solution()
    p "weight:value"
    solution.each_with_index do |item, i|
      p "#{data_set.w[i]} : #{data_set.v[i]}" if (item==1)
    end
    p "---------"
    p "#{get_total_weight(solution)} : #{get_total_value(solution)}"
  end
end
