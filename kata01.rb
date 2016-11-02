class Weather
  def initialize
    input = File.open('./weather.dat')
    @array = input.each_line.map(&:split)
    @array.slice!(0)
    @array.slice!(0)
    @array.each_with_index do |element, index|
      element.each_with_index do |s,i|
        @array[index][i] = s.to_i
      end
    end
    @spread = []
  end

  def lowest_spread
    @array.each do |info|
      @spread << (info[1]-info[2])
    end
    spread_sort = @spread.sort
    lowest_val = spread_sort[0]
    lowest_day = @spread.index(lowest_val) + 1
    return "Day #{lowest_day}"
  end
end

testing = Weather.new
puts testing.lowest_spread