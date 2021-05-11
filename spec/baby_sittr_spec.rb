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

    describe '#calculate_pay' do
        context 'gets paid $12/hour from start-time to bedtime' do
            it 'returns $12 for a start of 5PM and bedtime of 6PM' do
                result = BabySittr.new(start_time: '5PM', bed_time: '6PM', end_time: '6PM').calculate_pay
                expect(result).to eq('$12')
            end

            it 'returns $24 for a start of 5PM and bedtime of 7PM' do
                result = BabySittr.new(start_time: '5PM', bed_time: '7PM', end_time: '7PM').calculate_pay
                expect(result).to eq('$24')
            end

            it 'returns $12 for a start of 6PM and bedtime of 7PM' do
                result = BabySittr.new(start_time: '6PM', bed_time: '7PM', end_time: '7PM').calculate_pay
                expect(result).to eq('$12')
            end
        end

        context 'gets paid $8/hour from bedtime to midnight' do
            it 'returns $8 for a start of 11PM and bedtime of 11PM' do
                result = BabySittr.new(start_time: '11PM', bed_time: '11PM', end_time: '12AM').calculate_pay
                expect(result).to eq('$8')
            end

            it 'returns $16 for a start of 10PM and bedtime of 10PM' do
                result = BabySittr.new(start_time: '10PM', bed_time: '10PM', end_time: '12AM').calculate_pay
                expect(result).to eq('$16')
            end
        end
    end
end