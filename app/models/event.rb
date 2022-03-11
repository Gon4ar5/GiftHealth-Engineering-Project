class Event
  attr_accessor :name

  EVENT_INCOME_LIST = {
    'created': 0,
    'filled': 5,
    'returned': -1
  }.freeze

  def initialize(name)
    self.name = name
  end

  def is_filled?
    name == 'filled'
  end
end
