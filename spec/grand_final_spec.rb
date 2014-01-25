
require_relative '../lib/airport'
require_relative '../lib/plane'



describe "The grand finale (last spec)" do

	let(:airport) 		{Airport.new({:capacity => 6 })}
	let(:test_planes) {Array.new}

	def fill_airport_with_planes
		6.times { test_planes << Plane.new }	
		test_planes.each { |plane| plane.request_landing(airport) }
	end

	before do
		Airport.any_instance.stub(:stormy_weather? => false)
	end
	
	it "all planes can land" do
		fill_airport_with_planes
		expect(airport.planes.count).to eq(6)
		airport.planes.each {|plane| expect(plane).to be_landed}
	end

	it "The airport now should be full after 6 planes landing" do
		fill_airport_with_planes
	 	expect(airport).to be_full
	end

	it "All planes sould be flying after take off" do
		fill_airport_with_planes
		test_planes.each {|plane| plane.request_take_off(airport)}
		airport.planes.each {|plane| expect(plane).to be_flying}
	end

end




