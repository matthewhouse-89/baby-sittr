require 'baby_sittr'

RSpec.describe BabySittr do
    it 'exists' do
        baby_sitter = BabySittr.new()
        expect(baby_sitter).to be_truthy
    end

end