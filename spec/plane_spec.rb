require 'plane'
require 'airport'
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is implemented.
#
# If the airport is full then no planes can land


describe 'plane' do

	let(:plane) { Plane.new('spitfire') }
	let(:airport) { Airport.new("heathrow", 100) 	}

	it 'should be created with a name' do
		expect(plane.name).to eq 'spitfire'
	end

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

	it 'should change its flying status after landing' do
		expect(plane).to be_flying
		airport.accept_plane(plane)
		expect(plane).to_not be_flying
	end

	it 'should change its flying status after takeing off' do
		expect(plane).to be_flying
		airport.accept_plane(plane)
		expect(plane).to_not be_flying
		airport.release_plane(plane)
		expect(plane).to be_flying
	end

end
