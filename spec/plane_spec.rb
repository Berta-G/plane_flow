require_relative '../lib/plane'


describe Plane do
	let(:plane) {Plane.new}
	let(:airport) {Airport.new}

	it "has a flying status when created" do
		expect(plane.status).to eq(:flying)
	end

	it "can land on an airport" do
		plane.land(airport)
		expect(plane.status).to eq(:landed)
	end

	it "can take off from an airport" do
		plane.status = :landed
		plane.take_off(airport)
		expect(plane.status).to eq(:flying)
	end

	it "cannot land if stormy weather" do
		expect {plane.land(airport)}.to raise_error
	end

	it "cannot take off if stormy weather" do
		expect {plane.take_off(airport)}.to raise_error
	end


end