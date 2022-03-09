class Event
  attr_accessor :name

  event_list = {
  	"created": 0,
  	"filled": 5,
  	"returned": -6
  }

  def initialize(name)
  	@name = name
  end
end