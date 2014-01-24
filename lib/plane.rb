
class Plane

	attr_accessor :status

	def initialize(status = :flying)
		@status = status
	end
	

	def status
		@status
	end

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
		@status == :landed
	end

	def flying?
		@status == :flying
	end

end
