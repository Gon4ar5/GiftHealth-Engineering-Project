require './services/parser'
require 'pry'

def filled_sum(values)
  values.map { |h| h == 'filled' ? 5 : -6 }.sum
end

def filled_count(values)
  values.map { |h| h == 'filled' ? 1 : -1 }.sum
end

def index_of_created_event(hash)
  created_index = hash.map { |_, v| v.flatten.find_index('created') }[0]
  return unless created_index

  hash.map {|_, v| v.flatten[created_index+1..-1]}
end

def delete_events_before_created(hash) # rename
  hash_with_events_after_created = index_of_created_event(hash)
  return unless hash_with_events_after_created

  { hash.first[0] => [filled_sum(hash_with_events_after_created[0]), filled_count(hash_with_events_after_created[0])] }
end

def group_by_patient_with_cost(grouped_by_patient)
  grouped_by_patient.map { |grouped| delete_events_before_created(grouped) }.flatten.compact
end

def sum_of_income_and_fills_count(key, value)
  { key.first => [value.map(&:first).sum, value.map { |x| x[1] }.sum] }
end

def remove_names_from_hash_values(grouped)
  grouped.each { |_, v| hash_values(v) }
end

def hash_values(values)
  values.map! { |h| h.values.flatten }
end

def last_group_by(grouped)
  grouped = remove_names_from_hash_values(grouped.group_by(&:keys))
  grouped.map { |k, v| sum_of_income_and_fills_count(k, v) }
end

action_list = Parser.parse_file('./test_data/myfile.txt')

grouped_by_patient_and_drug = action_list.group_by { |el| [el[0].name, el[1].name] }.each { |_, v| v.map! { |h| [h[2].name] } }

grouped_by_patient = grouped_by_patient_and_drug.map { |k, v| { k[0] => v } }

gbpwc = group_by_patient_with_cost(grouped_by_patient)

final_group_by = last_group_by(gbpwc)
presenter = final_group_by.map { |x| "#{x.first.first}: #{x.first[1][1]} fills $#{x.first[1][0]} income" } # to pres
presenter.each { |x| p x }