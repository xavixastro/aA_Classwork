class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all?{|char| POSSIBLE_PEGS.keys.include?(char.upcase) }
  end

  def self.random(length)
    Code.new(Array.new(length){POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map{|char| char.upcase}
    else
      raise "Error"
    end
  end

  def pegs
    @pegs
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, idx|
      count += 1 if self.pegs[idx] == peg
    end
    return count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg,idx|
      if self.pegs.include?(peg)
        count += 1
      end
    end
    count - num_exact_matches(guess)
  end

  def ==(instance)
    return false if instance.length != self.length
    instance.pegs == self.pegs
  end


end
