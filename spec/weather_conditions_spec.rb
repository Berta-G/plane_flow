require_relative '../lib/weather_conditions'

class Weather
	include WeatherCondition
end

describe WeatherCondition do

	let(:weather) { Weather.new }

	it "returns true to stormy weather if weather is stormy" do
		Weather.any_instance.stub(:set_weather_condition => :stormy)
		expect(weather.stormy_weather?).to be_true
	end

	it "returns false to stormy weather if weather is sunny" do
		Weather.any_instance.stub(:set_weather_condition => :sunny)
		expect(weather.stormy_weather?).to be_false
	end
	
end