require_relative 'room'

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}

    hash.each do |r_name, cap|
      @rooms[r_name] = Room.new(cap)
    end
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  attr_reader :rooms

  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(person, name)
    if !room_exists?(name)
      p 'sorry, room does not exist'
    else
      success = @rooms[name].add_occupant(person)
      if success
        p 'check in successful'
      else
        p 'sorry, room is full'
      end
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts "#{name}: #{room.available_space}"
    end
  end
end
