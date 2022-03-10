class Action
  attr_accessor :drug, :event, :patient

  def initialize(drug, event, patient)
    self.drug = drug
    self.event = event
  	self.patient = patient
  end
end
