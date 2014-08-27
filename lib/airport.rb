class Airport

	def initialize(name)
		@name = name
		@planes = []
	end

	attr_accessor :name

	def planes_count
		@planes.count
	end

end
