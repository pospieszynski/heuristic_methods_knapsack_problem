class DataSet
  attr_accessor :g, :n, :w, :v
  def initialize(filename)
    @w, @v = [], []
    File.open("/home/avest/programming/ruby-kp-problem/datasets/#{filename}", "r") do |file|
      iterator = 0
      file.each_line do |line|
        if(iterator == 0)
          @g = Integer(line)
        else
          weight, value = line.split(":")
          @w << Integer(weight)
          @v << Integer(value)
        end
        iterator += 1
      end
     @n = iterator - 1
    end
  end
end
