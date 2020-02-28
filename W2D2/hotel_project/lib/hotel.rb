require_relative "room"

class Hotel
  def initialize(name,hash)
    @name=name
    @rooms={}
    hash.each do |k,v|
        newroom=Room.new(v)
        @rooms[k]=newroom
    end
  end

  def name
    new_name = @name.split
    new_name.map{|word|word[0].upcase + word[1..-1]}.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    if @rooms[room_name]
        return true
    else
        return false
    end
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        puts "sorry, room does not exist"
    else
        if @rooms[room_name].add_occupant(person)
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end
  end

  def has_vacancy?
    @rooms.values.any? {|room| !room.full?}
  end

  def list_rooms
    @rooms.each do |k,v|
        puts k + " " + v.available_space.to_s
    end
  end
end
