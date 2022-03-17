require './app/models/action'
require './app/models/patient'
require './app/models/drug'
require './app/models/event'

RSpec.describe Action, type: :model do
  let(:patient_name) { "Nick" }
  let(:drug_name) { "A" }
  let(:patient) { Patient.new(patient_name) }
  let(:drug) { Drug.new(drug_name) }
  let(:event_name) { 'filled' }
  let(:event) { Event.new(event_name) }

  context 'creation of an action' do
    it 'create action object' do
      action = Action.new(patient, drug, event)

      expect(action.patient).to eq(patient)
      expect(action.patient.name).to eq(patient_name)
      expect(action.drug).to eq(drug)
      expect(action.drug.name).to eq(drug_name)
      expect(action.event).to eq(event)
    end
  end

  context '.create_hash_of_action?' do
    it 'create action hash' do
      action = Action.new(patient, drug, event)
      valid_hash = { patient_name: patient_name, drug_name: drug_name, event: event }

      expect(action.create_hash_of_action).to eq('')
    end
  end
end
