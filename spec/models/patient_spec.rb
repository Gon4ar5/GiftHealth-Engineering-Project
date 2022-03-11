require './app/models/patient'

RSpec.describe Patient, type: :model do
  context 'creation of a patient' do
    let(:patient_name) { "A" }

    it 'create patient object' do
      patient = Patient.new(patient_name)

      expect(patient.name).to eq(patient_name)
    end
  end
end
