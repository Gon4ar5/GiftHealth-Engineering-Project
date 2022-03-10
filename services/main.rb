require './models/my_module'

class Main
  extend MyModule

  def self.start
    action_list = Parser.parse_file('./test_data/myfile.txt')
    grouped = grouped_by_patient_and_drug(action_list)
    grouped = grouped_by_patient(grouped)
    grouped = grouped.map { |h| group_by_sum_and_numbers(h) }.compact.group_by(&:keys)
    grouped = remove_dublicated_names_from_hash_values(grouped)
    ConsolePresenter.output(grouped)
  end
end
