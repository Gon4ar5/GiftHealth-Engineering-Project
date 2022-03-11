class Action
  attr_accessor :drug, :event, :patient

  def initialize(patient, drug, event)
    self.drug = drug
    self.event = event
    self.patient = patient
  end

  def create_hash_of_action
    { patient_name: patient.name, drug_name: drug.name, event: event }
  end
end
