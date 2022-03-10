class Action
  attr_accessor :drug, :event, :patient

  def initialize(patient, drug, event)
    self.drug = drug
    self.event = event
    self.patient = patient
  end

  def create_array_of_action
    [patient.name, drug.name, event]
  end
end
