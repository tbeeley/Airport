class Plane

	def initialize(name)
		@name = name
		@flying = true
	end

	attr_accessor :name

	def take_off
		@flying = true
	end

	def flying?
		@flying
	end

	def land
		@flying = false
	end

end
