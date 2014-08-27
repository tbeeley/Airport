require 'airport'

describe 'airport' do

	context 'when created' do

		it 'should have no planes' do
			heathrow = Airport.new('heathrow')
			expect(heathrow.planes_count).to eq 0
		end

	end

end
