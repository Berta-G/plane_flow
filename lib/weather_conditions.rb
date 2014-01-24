module WeatherCondition

	def set_weather_condition
  	  rand < 0.90 ? :sunny : :stormy
	end

	def stormy_weather?
		set_weather_condition == :stormy
	end

	def sunny_weather?
		set_weather_condition == :sunny
	end

end