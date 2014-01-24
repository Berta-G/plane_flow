require_relative '../lib/plane'


describe Plane do
	let(:plane) {Plane.new}
	let(:airport) {Airport.new}

	it "has a flying status when created" do
		expect(plane.status).to eq(:flying)
	end

	context "not stormy weather weather" do

		before do
			Airport.any_instance.stub(:stormy_weather? => false)
		end

		it "can land on an airport if it's sunny" do
			plane.request_landing(airport)
			expect(plane.status).to eq(:landed)
		end

		it "can take off from an airport if it's sunny" do
			plane.request_landing(airport)
			plane.request_take_off(airport)
			expect(plane).to be_flying
		end

	end

	context "stormy weather" do

		before do
			Airport.any_instance.stub(:stormy_weather? => true)
		end

		it "cannot land from an airport if stormy weather" do
			expect { plane.request_landing(airport) }.to raise_error
		end

		it "cannot take off from an airport if stormy weather" do
			expect {plane.request_take_off(airport)}.to raise_error
		end
	end


end
