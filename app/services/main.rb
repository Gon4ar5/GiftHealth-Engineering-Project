require './app/services/event_processor'

class Main
  extend EventProcessor

  def self.start(file_path)
    action_list = Parser.parse_file(file_path)
    grouped = process(action_list)
    ConsolePresenter.output(grouped)
  end
end
