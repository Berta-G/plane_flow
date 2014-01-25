require_relative '../lib/plane'


describe Plane do
	let(:plane) 	{Plane.new}
	let(:airport) {Airport.new}

	it "has a flying status when created" do
		expect((plane)).to be_flying
	end

	context "change of status" do
		it "can change from flying to landed" do
			plane.land
			expect(plane).to be_landed
		end

			it "can change from landed to flying" do
				plane.land
				plane.take_off
				expect(plane).to be_flying
		end
	end

	context "Sunny weather" do

		before do
			Airport.any_instance.stub(:stormy_weather? => false)
		end

		it "can land on an airport" do
			plane.request_landing(airport)
			expect(plane).to be_landed
		end

		it "can take off from an airport" do
			plane.request_landing(airport)
			plane.request_take_off(airport)
			expect(plane).to be_flying
		end
	end

	context "Stormy weather" do

		before do
			Airport.any_instance.stub(:stormy_weather? => true)
		end

		it "cannot land from an airport" do
			expect { plane.request_landing(airport) }.to raise_error
		end

		it "cannot take off from an airport" do
			expect {plane.request_take_off(airport)}.to raise_error
		end
	end
end
