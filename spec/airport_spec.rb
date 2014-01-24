require_relative '../lib/airport'

describe Airport do

	let(:airport)	{Airport.new}
	let(:plane) 	{Plane.new}

	it "can be created with a specific capacity" do
		airport = Airport.new({:capacity => 5})
		expect(airport.capacity).to eq(5)
	end


	context 'taking off and landing' do
		it "a plane can land in sunny weather" do
			Airport.any_instance.stub(:stormy_weather? => false)
			airport.land(plane)
			expect(airport.planes).to eq([plane])
		end

		it "a plane can take off in sunny weather" do
			Airport.any_instance.stub(:stormy_weather? => false)
			airport.land(plane)
			airport.take_off(plane)
			expect(airport.planes).to eq([])
		end
	end

	context 'traffic control' do

		it "a plane cannot land if airport is full" do
			Airport.any_instance.stub(:stormy_weather? => false)
			10.times { airport.land(plane) }
			expect { airport.land(plane) }.to raise_error
		end

		it "a plane cannot land if the weather is stormy" do 
			Airport.any_instance.stub(:stormy_weather? => true)
			expect { airport.land(plane)}.to raise_error
		end

		it "a plane cannot take off if the weather is stormy" do
			Airport.any_instance.stub(:stormy_weather? => true)
			expect { airport.take_off(plane)}.to raise_error
		end

	end

end




