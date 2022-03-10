class Event
  attr_accessor :name

  EVENT_INCOME_LIST = {
    "created": 0,
    "filled": 5,
    "returned": -6
  }.freeze

  def initialize(name)
    self.name = name
  end

  def filled_sum
    EVENT_INCOME_LIST[name.to_sym]
  end

  def filled_count
    name == 'filled' ? 1 : -1
  end
end
