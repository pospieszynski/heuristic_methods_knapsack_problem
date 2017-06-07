class Backtracker
  attr_accessor :data_set, :solution

  def initialize(ds)
    @data_set = ds
    @solution = []
  end

  def run
    solve([], 0)
  end

  def solve(current_items, index)
    current_items << index
    if (index == data_set.n || get_total_weight(current_items) > data_set.g)
      current_items.pop
      if (get_total_value(current_items) > get_total_value(solution))
        @solution = current_items # TODO check if should be cloned
      end
      return
    end

    while(index < data_set.n) do
      current_items.pop
      current_items << index
      #puts "items: #{current_items}"
      solve([].concat(current_items), index + 1) unless (get_total_weight(current_items) > data_set.g)
      index +=1
    end
  end

  def get_total_weight(weights)
    weights.reduce(0) { |acc, el| acc += data_set.w[el] }
  end

  def get_total_value(values)
    values.reduce(0) { |acc, el| acc += data_set.v[el] }
  end

  def print_solution()
    p "weight:value"
    solution.each do |i|
      p "#{data_set.w[i]} : #{data_set.v[i]}"
    end
    p "---------"
    p "#{get_total_weight(solution)} : #{get_total_value(solution)}"
  end

end
