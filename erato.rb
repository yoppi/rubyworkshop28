require 'benchmark'

PRIMESIZE = 100000
PRIME_TABLE = Array.new(PRIMESIZE, true)

def make_primetable
  PRIME_TABLE[0] = false 
  PRIME_TABLE[1] = false
  2.upto(Math.sqrt(PRIMESIZE)) do |i|
    if PRIME_TABLE[i]
      (i*2).step(PRIMESIZE, i) {|j| PRIME_TABLE[j] = false}
    end
  end
end

def prime? n
  PRIME_TABLE[n]
end

if __FILE__ == $0
  puts Benchmark.measure {
    make_primetable
    puts prime? 2
  }
  puts Benchmark::CAPTION
end

