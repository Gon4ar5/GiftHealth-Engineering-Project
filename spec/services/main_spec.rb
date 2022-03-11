require './app/services/main'
require './app/services/parser'
require './app/presenters/console_presenter'
require './app/models/action'
require './app/models/patient'
require './app/models/drug'
require './app/models/event'

RSpec.describe Main do
  context '.start' do
    let(:file_path) { './test_data/test1.txt' }
    let(:output_data) { "Nick: 0 fills $0 income\nMark: 2 fills $9 income\nJohn: 0 fills $-1 income\n" }

    it 'prints the correct information to the output stream' do
      expect { Main.start(file_path) }.to output(output_data).to_stdout
    end
  end

  context 'event_processor' do
    let(:patient) { Patient.new('Nick') }
    let(:drug) { Drug.new('A') }
    let(:event) { Event.new('filled') }
    let(:action) { Action.new(patient, drug, event) }
    
    context '.group_by_patient_and_drug' do
      let(:action_list) { [action] }
      let(:result) { {[patient.name, drug.name]=>[event]} }

      it 'label' do
        grouped = Main.group_by_patient_and_drug(action_list)

        expect(grouped).to eq(result)
      end
    end

    context '.group_by_patient' do
      let(:grouped) { { [patient.name, drug.name] => [event] } }
      let(:result) { [{ patient.name => [event] }] }
      
      it 'label' do
        grouped_by_patient = Main.group_by_patient(grouped)

        expect(grouped_by_patient).to eq(result)
      end
    end

    context '.group_by_sum_and_numbers' do
      let(:grouped) { [{ patient.name => [event] }] }
      let(:result) { {} }

      it 'label' do
        grouped_by_sum_and_numbers = grouped.map { |x| Main.group_by_sum_and_numbers(x) }.compact.group_by(&:keys)

        expect(grouped_by_sum_and_numbers).to eq(result)
      end
    end

    context '.remove_duplicated_names_from_hash_values' do
      let(:grouped) { { ["Nick"]=>[{"Nick"=>[0, 0]}], ["Mark"] => [{"Mark"=>[9, 2]}], ["John"] => [{"John"=>[-1, 0]}] } }
      let(:output_result) { {["Nick"]=>[0, 0], ["Mark"]=>[9, 2], ["John"]=>[-1, 0]} }

      it 'label' do
        grouped_without_duplicated_names = Main.remove_duplicated_names_from_hash_values(grouped)

        expect(grouped_without_duplicated_names).to eq(output_result)
      end
    end

    context '.delete_events_before_created' do
      let(:event1) { Event.new('created') }
      let(:grouped) { { "Mark"=>[event, event1, event] } }
      let(:output_result) { [event] }

      it 'label' do
        grouped_without_events_before_create = Main.delete_events_before_created(grouped)

        expect(grouped_without_events_before_create).to eq(output_result)
      end
    end

    context '.events_income_and_count' do
      let(:event1) { Event.new('returned') }
      let(:grouped) { [event, event1, event] }
      let(:output_result) { { income: 4, count: 1 } }

      it 'label' do
        income_and_count_of_event = Main.events_income_and_count(grouped)

        expect(income_and_count_of_event).to eq(output_result)
      end
    end
  end
end
