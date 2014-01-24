require_relative '../lib/airport'

describe Airport do

	let(:airport)	{Airport.new}
	let(:plane) 	{double :plane}


	context 'taking off and landing' do
		it "a plane can land" do
			expect(airport.land(plane)).to eq([plane])
		end

		it "a plane can take off" do
			airport.land(plane)
			airport.take_off(plane)
			expect(airport.planes).to eq([])
		end
	end

	context 'traffic control' do

		it "a plane cannot land if airport is full" do
			10.times { airport.land(plane) }
			expect { airport.land(plane) }.to raise_error
		end

		it "a plane cannot land if the weather is stormy" do 
			weather_condition = :stormy
			expect { airport.land(plane)}.to raise_error
		end

		it "a plane cannot take off if the weather is stormy" do
			expect { airport.take_off(plane)}.to raise_error
		end

	end

end




