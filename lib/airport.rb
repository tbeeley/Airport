class Airport

	def initialize(name, capacity = 20, stormy = false)
		@name = name
		@capacity = capacity
		@planes = []
		@stormy = stormy
	end

	attr_accessor :name
	attr_accessor :planes
	attr_accessor :capacity
	attr_accessor :stormy

	def plane_count
		@planes.count
	end

	def accept_plane(plane)
		raise 'No space here' if full?
		raise 'Unsafe to land' if stormy?
		planes << plane
		plane.land
	end


	def release_plane(plane)
		raise 'Unsafe to takeoff' if stormy?
		raise 'That plane is not parked at this airport' if !self.planes.include?(plane)
		plane.take_off
		planes.delete(plane)
	end

	def full?
		plane_count == self.capacity
	end

	def stormy?
		@stormy
	end

	def weather_deteriorates
		@stormy = true
	end

	def weather_improves
		@stormy = false
	end

	def bomb_scare
		planes.clear
	end

end
