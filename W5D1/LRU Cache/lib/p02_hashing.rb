class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |ele, i|
      sum+= (ele+i).hash
    end
    sum
  end
end

class String
  def hash
    sum = 0
    alpha = ("a".."z").to_a
    self.each_char.with_index do |ch, i|
      idx = alpha.index(ch.downcase)
      sum += (idx + i).hash 
    end
    sum 

    # sum = 0
    # self.chars.each_with_index do |ch, i|
    #   sum += (ch.hash+i)
    # end
    # sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.to_a.flatten.map{|el| el.is_a?(Symbol) ? el.to_s : el }
    arr.sort!
  end
end
