require 'plane'
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is implemented.
#
# If the airport is full then no planes can land


describe 'plane' do

	let(:plane) { Plane.new }

	it 'should have a flying status when created' do
		expect(plane.flying?).to be true
	end

	it 'should be able to take off' do
		plane.take_off
		expect(plane.flying?).to be true
	end

	it 'should be able to land' do
		plane.land
		expect(plane.flying?).to be false
	end

end
