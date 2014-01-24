require_relative 'weather_conditions'

class Airport

	include WeatherCondition

	DEFAULT_CAPACITY = 10

	def initialize(options={})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes ||= []
	end

	attr_accessor = :planes, :capacity

	def planes
		@planes
	end

	def capacity
		@capacity
	end

	def land(plane)
		raise "Airport is full" if full?	
		raise "Stormy weather, plane cannot land" if stormy_weather?
		planes << plane
		plane.land
	end

	def take_off(plane)
		raise "Stormy weather, plane cannot land" if stormy_weather?
		planes.delete(plane)
		plane.take_off
	end

	def full?
		planes.count >= capacity
	end


end