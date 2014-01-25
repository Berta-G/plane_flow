require_relative 'weather_conditions'

class Airport

	include WeatherCondition

	attr_accessor :capacity, :planes

	DEFAULT_CAPACITY = 10

	def initialize(options={})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end

	def land(plane)
		raise "Airport is full" if full?	
		raise "Stormy weather, plane cannot land" if stormy_weather?
		planes << plane
		plane.land
	end

	def take_off(plane)
		raise "Stormy weather, plane cannot land" if stormy_weather?
		raise "Plane not in this airport" if @planes.delete(plane).nil?
		plane.take_off
	end

	def full?
		planes.count >= capacity
	end


end