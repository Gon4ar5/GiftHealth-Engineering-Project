class Event
  attr_accessor :name

  EVENT_INCOME_LIST = {
    "created": 0,
    "filled": 5,
    "returned": -1  # refine logic to use -1 instead -6 
  }.freeze

  def initialize(name)
    self.name = name
  end

  def filled_sum # rename (event_sum? maybe)
    EVENT_INCOME_LIST[name.to_sym]
  end

  def filled_count # is_field?
    name == 'filled' ? 1 : -1 # using -1 bad
  end
end
