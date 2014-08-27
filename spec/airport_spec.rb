require 'airport'
require 'plane'

describe 'airport' do

	context 'when created' do

		let(:heathrow)  { Airport.new("heathrow", 100)}
		let(:boeing)	{ double(:plane)		 	  }


		it 'should have no planes' do
			expect(heathrow.plane_count).to eq 0
		end

		it 'should be created with a name' do
			expect(heathrow.name).to eq 'heathrow'
		end

		it 'should have a custom capacity' do
			expect(heathrow.capacity).to eq 100
		end

	end

	context 'takeoff and landing' do

		let(:heathrow)  { Airport.new("heathrow")}
		let(:boeing)	{ double(:plane)		 }

		it 'can accept a plane for landing' do
			expect(heathrow.plane_count).to eq 0
			heathrow.accept_plane(boeing)
			expect(heathrow.plane_count).to eq 1
		end

		it 'can release a plane for takeoff' do
			heathrow.accept_plane(boeing)
			expect(heathrow.plane_count).to eq 1
			heathrow.release_plane(boeing)
			expect(heathrow.plane_count).to eq 0
		end

	end

end
