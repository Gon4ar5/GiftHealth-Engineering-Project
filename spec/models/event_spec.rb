require './app/models/event'

RSpec.describe Event, type: :model do
  context 'creation of a event' do
    let(:event_name) { "filled" }

    it 'create event object' do
      event = Event.new(event_name)

      expect(event.name).to eq(event_name)
    end
  end

  context '.is_filled?' do
    let(:event_name) { "filled" }
    let(:event_name1) { "returned" }
    let(:event_name2) { "created" }

    it 'return valid filled status' do
      event = Event.new(event_name)
      event1 = Event.new(event_name1)
      event2 = Event.new(event_name2)

      expect(event.is_filled?).to eq(true)
      expect(event1.is_filled?).to eq(false)
      expect(event2.is_filled?).to eq(false)
    end
  end
end
