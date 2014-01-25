require_relative '../lib/airport'

describe Airport do

	let(:airport)	{Airport.new}
	let(:plane) 	{Plane.new}


	it "can be created with a specific capacity" do
		airport = Airport.new({:capacity => 5})
		expect(airport.capacity).to eq(5)
	end

	context "Sunny Weather" do

		before do
			Airport.any_instance.stub(:stormy_weather? => false)
		end

		it "a plane can land in sunny weather" do
			airport.land(plane)
			expect(airport.planes).to eq([plane])
		end

		it "a plane can take off in sunny weather" do
			airport.land(plane)
			airport.take_off(plane)
			expect(airport.planes).to eq([])
		end

		it "a plane cannot land if airport is full" do
			10.times { airport.land(plane) }
			expect { airport.land(plane) }.to raise_error
		end

		it "if the plane is not in the airport it wont take off" do
			expect {airport.take_off(plane)}.to raise_error
		end

	end

	context 'Stormy Weather' do

		before do
			Airport.any_instance.stub(:stormy_weather? => true)
		end

		it "a plane cannot land stormy weather" do 
			expect { airport.land(plane)}.to raise_error
		end

		it "a plane cannot take off in stormy weather" do
			expect { airport.take_off(plane)}.to raise_error
		end

	end

end




