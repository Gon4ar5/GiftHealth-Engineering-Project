require "./models/patient"
require "./models/drug"
require "./models/event"
require "./models/action"


class Parser
  def self.parse_file(filename)
  	File.open(filename).map do |line|
      parse_line(*line.split(" "))
	  end
  end

  def self.parse_line(patient_name, drug_name, event_name)
  	patient = Patient.new(patient_name)
  	drug = Drug.new(drug_name)
  	event = Event.new(event_name)
  	Action.new(patient, drug, event)
  end
end
