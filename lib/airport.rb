class Airport

	def initialize(name, capacity = 20)
		@name = name
		@capacity = capacity
		@planes = []
		@stormy = false
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
		planes << plane
	end


	def release_plane(plane)
		planes.pop
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

end
