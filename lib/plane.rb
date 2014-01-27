
class Plane

	attr_reader :status

	def initialize
		@status = :flying
	end

	# these two methods don't do much,
	# it would make more sense to not have them at all
	# because we can always call the airport's methods directly
	def request_take_off(airport)
		airport.take_off(self)
	end

	def request_landing(airport)
		airport.land(self)
	end

	def take_off
		@status = :flying
	end

	def land
		@status = :landed
	end

	def landed?
		status == :landed
	end

	def flying?
		status == :flying
	end

end
