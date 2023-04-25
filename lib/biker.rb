class Biker
  attr_reader :name, 
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    while @acceptable_terrain.include?(ride.terrain) && ride.distance < @max_distance
      if @rides[ride] == nil
        @rides[ride] = []
      end
      @rides[ride] << time
      require 'pry'; binding.pry
    break
    end
  end

end

