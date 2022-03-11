require './app/models/drug'

RSpec.describe Drug, type: :model do
  context 'creation of a drug' do
    let(:drug_name) { "A" }

    it 'create drug object' do
      drug = Drug.new(drug_name)

      expect(drug.name).to eq(drug_name)
    end
  end
end
