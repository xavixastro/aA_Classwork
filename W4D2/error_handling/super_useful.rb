# PHASE 2
# def convert_to_int(str)
#   begin
#   Integer(str)
#   rescue ArgumentError
#     nil
#   end

# end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class NotCoffeeError < StandartError; end

def reaction(maybe_fruit)
  raise NotCoffeeError.new('Dude thats not coffee') if !FRUITS.include?(maybe_fruit)
  # if FRUITS.include? maybe_fruit
  rescue NotCoffeeError => e
    retry if maybe_fruit == "coffee"
  else  
    puts "OMG, thanks so much for the #{maybe_fruit}!"
      # raise StandartError
  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

# # PHASE 4
# class BestFriend
#   def initialize(name, yrs_known, fav_pastime)
#     @name = name
#     @yrs_known = yrs_known
#     @fav_pastime = fav_pastime
#   end

#   def talk_about_friendship
#     puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
#   end

#   def do_friendstuff
#     puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
#   end

#   def give_friendship_bracelet
#     puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
#   end
# end


# p convert_to_int("hello")
p feed_me_a_fruit
