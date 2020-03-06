class Array
  def remove_dups
    new_arr = []
    self.each do |ele|
      new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
  end

  def two_sum
    res = []
    (0...self.length - 1).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        res << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    res
  end

  def my_transpose
    self.transpose
  end

end

def stock_picker(arr)
  profit = 0
  buy_idx = nil
  sell_idx = nil
  indices = nil

  arr.each_with_index do |buy_price, i|
    buy_idx = i 
    arr.each_with_index do |sell_price, j|
      next if j <= i
      sell_idx = j
      value = sell_price - buy_price
      if value > profit
        profit = value
        indices = [i,j]
      end

    end
  end

  indices

end
