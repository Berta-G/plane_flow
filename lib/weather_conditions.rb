module WeatherCondition

	def set_weather_condition
  	  rand < 0.85 ? :sunny : :stormy
	end

	def stormy_weather?
		set_weather_condition == :stormy
	end
	
end