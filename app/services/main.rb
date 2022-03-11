require './app/services/event_proccessor'

class Main
  extend EventProccessor

  def self.start
    action_list = Parser.parse_file('./test_data/myfile.txt')
    grouped = proccessor(action_list)
    ConsolePresenter.output(grouped)
  end
end
