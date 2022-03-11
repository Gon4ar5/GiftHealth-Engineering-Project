require './app/presenters/console_presenter'

describe ConsolePresenter do
  context '.output' do
    let(:input_data) { [['Nick'], [{:income=>0, :count=>0}]] }
    let(:output_data) { "Nick: 0 fills $0 income\n" }

    it 'prints the correct information to the output stream' do
      expect { ConsolePresenter.output(input_data) }.to output(output_data).to_stdout
    end
  end
end
