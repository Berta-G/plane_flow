require_relative '../lib/plane'


describe Plane do
	let(:plane) {Plane.new}

	it "has a flying status when created" do
		expect(plane.status).to be(:flying)
	end

end