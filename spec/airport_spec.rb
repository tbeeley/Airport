require 'airport'
require 'plane'

describe 'airport' do

	let(:airport)  			{ Airport.new("heathrow", 100) 				}
	let(:stormy_airport) 	{ Airport.new("gatwick", 100, true)	}
	let(:plane)	   			{ Plane.new('spitfire') }
	let(:plane2)			{ Plane.new('hurricane') }


	def fill_airport(airport)
		100.times { airport.accept_plane(plane) }
	end

	context 'when created' do

		it 'should have no planes' do
			expect(airport.plane_count).to eq 0
		end

		it 'should have good weather conditions, unless stated otherwise' do
			expect(airport.stormy?).to be false
			expect(stormy_airport.stormy?).to be true
		end

		it 'should be created with a name' do
			expect(airport.name).to eq 'heathrow'
		end

		it 'should have a custom capacity' do
			expect(airport.capacity).to eq 100
		end

		it 'should know if the airport is full' do
			fill_airport(airport)
			expect(airport.full?).to eq true
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

	context 'weather' do

		it 'can change for the worse' do
			airport.weather_deteriorates
			expect(airport.stormy?).to eq true
		end

		it 'can change for the better' do
			stormy_airport.weather_improves
			expect(stormy_airport.stormy?).to eq false
		end
	end

	context 'air traffic control' do

		it 'will not accept a plane if full' do
			fill_airport(airport)
			expect{ airport.accept_plane(plane) }.to raise_error 'No space here'
		end

		it 'will not accept a plane if weather is stormy' do
			expect{ stormy_airport.accept_plane(plane) }.to raise_error 'Unsafe to land'
		end

		it 'cannot release a plane if weather is stormy' do
			expect { stormy_airport.release_plane(plane) }.to raise_error 'Unsafe to takeoff'
		end

		it 'should not release a plane if it is not at the airport' do
			airport.accept_plane(plane)
			expect(airport.plane_count).to eq 1
			expect{ airport.release_plane(plane2) }.to raise_error 'That plane is not parked at this airport'
			expect(airport.plane_count).to eq 1
		end

		it 'should release all planes in the event of a bomb scare' do
			fill_airport(airport)
			airport.bomb_scare
			expect(airport.plane_count).to eq 0
		end

	end


	context 'The grand finale' do

		let(:airport)  			{ Airport.new("heathrow", 100) 				}
		let(:plane)   			{ Plane.new }

		it 'all planes can land and all planes can take off' do

			airport.stub(:weather_stormy?).and_return(false)

			planes = Array.new(airport.capacity) { Plane.new('colt') } # 20 new planes
			planes.each do |plane|
				expect(plane).to be_flying
				airport.accept_plane(plane)
				expect(plane).not_to be_flying
			end

		end

	end

end
