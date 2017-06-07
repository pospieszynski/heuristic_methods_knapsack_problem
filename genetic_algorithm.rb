class GeneticAlgorithm
  attr_accessor :data_set, :solution, :population_size, :generations, :crossover_prob, :mutation_prob

  def initialize(ds, pop_size, generations, crossover_prob, mutation_prob)
    @data_set = ds
    @solution = [[], 0]
    @generations = generations
    @population_size = pop_size
    @crossover_prob = crossover_prob
    @mutation_prob = mutation_prob
  end

  def run
    # generate random solutions
    population = []
    @population_size.times do
      chromosome = []
      data_set.n.times do |i|
        if ((rand(0..1) == 1) && (data_set.w[i] + get_total_weight(chromosome) <= data_set.g))
          chromosome << 1
        else
          chromosome << 0
        end
      end
      population << [chromosome, 0]
    end

    generations.times do |generation|
      # calculate fitness
      population_size.times do |i|
        population[i][1] = get_total_value(population[i][0])
      end

      # build roulette
      roulette = []
      population.count.times do |ind|
        slice = (population[ind][1]/5).to_i
        slice.times do
          roulette << ind
        end
      end

      # spin the roulette(selection)
      new_population = []
      range = roulette.count - 1
      population.count.times do |ind|
        chromosome = rand(range)
        new_population << population[roulette[chromosome]]
      end

      # crossover
      member = 0
      probablility = Array.new(100, 0)
      crossover_prob.times { |i| probablility[i] = 1 }
      
      while (member < population.size - 1)
        if (probablility[rand(0..99)] == 1)
          crossover_point = data_set.n / 2 # rand((data_set.n - 1))
          gen = 0
          while (gen <= crossover_point)
            tmp = new_population[member][0][gen]
            new_population[member][0][gen] = new_population[member + 1][0][gen]
            new_population[member + 1][0][gen] = tmp
            gen+=1
          end
        end
        member+=2
      end

      # mutation
      probablility.map! { |_| 0}
      mutation_prob.times { |i| probablility[i] = 1 }
      member = 0
      while (member < new_population.count)
        if (probablility[rand(0..99)] == 1)
          index_gen_to_mutate = rand(data_set.n)
          new_population[member][0][index_gen_to_mutate]
          new_sol = [].concat(new_population[member][0])
          new_sol[index_gen_to_mutate] = new_sol[index_gen_to_mutate] == 1 ? 0 : 1
          new_population[member][0] = [].concat(new_sol) if get_total_weight(new_sol) <= data_set.g
        end
        member+=1
      end

      population = [].concat(new_population)
    end

    # find best individual in final population
    population_size.times do |i|
      population[i]
      @solution = population[i] if (get_total_value(population[i][0]) > get_total_value(@solution[0]))
    end
    p "solution: "
    p solution
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
end
