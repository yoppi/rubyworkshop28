class CalcDrill
  INTERVAL = 10
  LEVEL = {1 => "かんたん", 2 => "むずかしい"}
  OPERATOR = ['+', '-', '*', '/']

  def initialize(num)
    @prob_num = num
    @start_time = Time.now
    @correct = 0
    @wrong = 0
  end
  
  def run
    puts "計算#{@prob_num}開始"
    print "難易度を選択してください．#{LEVEL.to_a.join(': ')}> "
    set_level(gets.chomp.to_i)
    print "#{@level}: #{LEVEL[@level]}を開始します. Please Enter> "
    gets

    cnt = 0 
    problems = make_problem   
    problems.each do |prob|
      print "#{prob} = "; input = gets.chomp.to_i
      if input == eval(prob)
        puts "正解です!"; @correct += 1
      else
        puts "間違いです!" ; @wrong += 1
      end
      cnt += 1
      puts "#{cnt}問突破" if (cnt % INTERVAL == 0) 
    end
    puts "#{@prob_num}問終了しました" 
    puts "正解    : #{@correct}問"
    puts "不正解  : #{@wrong}問"
    puts "タイム  : #{Time.at(Time.now - @start_time).strftime("%M:%S")}"
  end

  def make_problem
    problems = []
    case @level
    when 1
      1.upto(@prob_num) do |i|
        problems << "#{rand(9)} #{OPERATOR[rand(3)]} #{rand(9)}"
      end
    when 2
      loop do
        break if problems.size == @prob_num 
        first = rand(99); second = rand(99); op = OPERATOR[rand(4)]
        if op == '/' 
          if second == 0
            next 
          elsif first % second != 0
            next 
          end
        end
        problems << "#{first} #{op} #{second}"
      end
    end
    problems
  end

  def set_level(level)
    @level = level
  end
   
end

if __FILE__ == $0
  CalcDrill.new(10).run
end
