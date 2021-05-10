require 'baby_sittr'

RSpec.describe BabySittr do
    it 'exists' do
        baby_sitter = BabySittr.new()
        expect(baby_sitter).to be_truthy
    end

    describe '#valid?' do
        context 'starts no earlier than 5:00PM' do
            it 'returns true if start time is 5PM' do
                result = BabySittr.new(start_time: '5PM', end_time: '6PM').valid?
                expect(result).to be_truthy
            end

            it 'returns true if start time is 6PM' do
                result = BabySittr.new(start_time: '6PM', end_time: '7PM').valid?
                expect(result).to be_truthy
            end
        end
    end
end