
class Plane

	def initialize(status = :flying)
		@status = status
	end

	attr_accessor :status

	def status
		@status
	end

	def take_off(airport)
		airport.take_off(self)
		plane_is_flying
	end

	def land(airport)
		airport.land(self)
		plane_has_landed
	end

	def plane_is_flying
		@status = :flying
	end

	def plane_has_landed
		@status = :landed
	end

end
