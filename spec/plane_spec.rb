require_relative '../lib/plane'


describe Plane do
	let(:plane) {Plane.new}
	let(:airport) {Airport.new}

	it "has a flying status when created" do
		expect(plane.status).to eq(:flying)
	end

	it "can land on an airport if it's sunny" do
		Airport.any_instance.stub(:stormy_weather? => false)
		plane.land(airport)
		expect(plane.status).to eq(:landed)
	end

	it "can take off from an airport if it's sunny" do
		Airport.any_instance.stub(:stormy_weather? => false)
		plane.land(airport)
		plane.take_off(airport)
		expect(plane.status).to eq(:flying)
	end

	it "cannot land from an airport if stormy weather" do
		Airport.any_instance.stub(:stormy_weather? => true)
		expect { plane.land(airport) }.to raise_error
	end

	it "cannot take off from an airport if stormy weather" do
		Airport.any_instance.stub(:stormy_weather? => true)
		expect {plane.take_off(airport)}.to raise_error
	end


end
