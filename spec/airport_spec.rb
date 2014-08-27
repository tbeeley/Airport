require 'airport'
require 'plane'

describe 'airport' do

	let(:airport)  { Airport.new("heathrow", 100) }
	let(:plane)	   { double(:plane)		 	 	  }

	def fill_airport(airport)
		100.times { airport.accept_plane }
	end

	context 'when created' do

		it 'should have no planes' do
			expect(airport.plane_count).to eq 0
		end

		it 'should be created with a name' do
			expect(airport.name).to eq 'heathrow'
		end

		it 'should have a custom capacity' do
			expect(airport.capacity).to eq 100
		end

	end

	context 'takeoff and landing' do

		it 'can accept a plane for landing' do
			expect(airport.plane_count).to eq 0
			airport.accept_plane(plane)
			expect(airport.plane_count).to eq 1
		end

		it 'can release a plane for takeoff' do
			airport.accept_plane(plane)
			expect(airport.plane_count).to eq 1
			airport.release_plane(plane)
			expect(airport.plane_count).to eq 0
		end

	end

end
