require 'benchmark'
require 'pp'

PRIMESIZE = 100000
$prime_table = Array.new(PRIMESIZE, true)

def make_primetable
  $prime_table[0] = false 
  $prime_table[1] = false
  2.upto(Math.sqrt(PRIMESIZE)) do |i|
    if $prime_table[i]
      (i*2).step(PRIMESIZE, i) {|j| $prime_table[j] = false}
    end
  end
end

def prime? n
  $prime_table[n]
end

if __FILE__ == $0
  puts Benchmark.measure {
    make_primetable
    puts prime? 2
  }
  puts Benchmark::CAPTION
end

