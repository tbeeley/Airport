class Airport

	def initialize(name, capacity = 20)
		@name = name
		@capacity = capacity
		@planes = []
	end

	attr_accessor :name
	attr_accessor :planes
	attr_accessor :capacity

	def plane_count
		@planes.count
	end

	def accept_plane(plane)
		planes << plane
	end

	def release_plane(plane)
		planes.pop
	end

end
