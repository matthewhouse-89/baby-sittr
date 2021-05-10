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

            it 'returns false if start time is 4PM' do
                result = BabySittr.new(start_time: '4PM', end_time: '6PM').valid?
                expect(result).to be_falsey
            end

            it 'returns false if start time is 3PM' do
                result = BabySittr.new(start_time: '3PM', end_time: '7PM').valid?
                expect(result).to be_falsey
            end
        end

        context 'ends no later than 4:00PM' do
            it 'returns true if end time is 4AM' do
                result = BabySittr.new(start_time: '5PM', end_time: '4AM').valid?
                expect(result).to be_truthy
            end

            it 'returns true if end time is 3AM' do
                result = BabySittr.new(start_time: '5PM', end_time: '3AM').valid?
                expect(result).to be_truthy
            end

            it 'returns false if end time is 6AM' do
                result = BabySittr.new(start_time: '5PM', end_time: '6AM').valid?
                expect(result).to be_falsey
            end

            it 'returns false if end time is 7AM' do
                result = BabySittr.new(start_time: '5PM', end_time: '7AM').valid?
                expect(result).to be_falsey
            end
        end
    end
end