require 'securerandom'

class TSP
  INF = Float::INFINITY

  def initialize(n)
    @n = n
    @graph = generate_graph(n)
    @memo = Array.new(n) { Array.new(1 << n, nil) }
    @parent = Array.new(n) { Array.new(1 << n, nil) }
  end

  def generate_graph(n)
    Array.new(n) do |i|
      Array.new(n) do |j|
        i == j ? 0 : SecureRandom.random_number(1..100)
      end
    end
  end

  def solve
    tsp(0, 1)
  end

  def tsp(pos, visited)
    return @graph[pos][0] if visited == (1 << @n) - 1

    return @memo[pos][visited] if @memo[pos][visited]

    min_cost = INF

    (0...@n).each do |city|
      next if visited & (1 << city) != 0

      new_visited = visited | (1 << city)
      cost = @graph[pos][city] + tsp(city, new_visited)

      if cost < min_cost
        min_cost = cost
        @parent[pos][visited] = city
      end
    end

    @memo[pos][visited] = min_cost
  end

  def reconstruct_path
    path = [0]
    current = 0
    visited = 1

    while (next_city = @parent[current][visited])
      path << next_city
      visited |= (1 << next_city)
      current = next_city
    end

    path << 0
    path
  end

  def print_graph
    puts "Graph:"
    @graph.each_with_index do |row, index|
    puts "#{index}   = #{row.inspect}"
  end
end
end


print "Enter the number of cities: "
n = gets.chomp.to_i

tsp_solver = TSP.new(n)
tsp_solver.print_graph

puts "\nSolving TSP for #{n} cities..."

start_time = Time.now
cost = tsp_solver.solve
path = tsp_solver.reconstruct_path
end_time = Time.now

elapsed = end_time - start_time

puts "\nRoute taken:"
puts path.join(" -> ")

puts "\nCost:"
puts cost

puts "\nTime taken: #{elapsed.round(4)} seconds"
puts
