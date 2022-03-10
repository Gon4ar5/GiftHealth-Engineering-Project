require './services/parser'
require 'pry'

  #{["Nick"]=>[{"Nick"=>[0, 0]}], ["Mark"]=>[{"Mark"=>[9, 2]}], ["John"]=>[{"John"=>[-1, 0]}]}
  #[[0, 0], [9, 2], [-1, 0]]
def remove_names_from_hash_values(grouped)
  grouped.each { |_, v| hash_values(v) }
end

def hash_values(values)
  values.map! { |h| h.values.flatten }
end

def last_group_by(grouped)
  grouped = remove_names_from_hash_values(grouped.group_by(&:keys))
  grouped.map { |k, v| sum_of_income_and_fills_count(k, v).flatten }
end

def delete_events_before_created(hash)
  created_index = hash.map { |_, v| v.flatten.map(&:name).find_index('created') }.first
  return unless created_index

  hash.map { |_, v| v.flatten[created_index + 1..-1] }.flatten
end

# rename
def count_sum_and_number(hash)
  events_after_created = delete_events_before_created(hash)
  return unless events_after_created

  { hash.keys.first => [events_after_created.map(&:filled_sum).sum, events_after_created.map(&:filled_count).sum] }
end

def patient_with_cost(grouped_by_patient)
  grouped_by_patient.map { |grouped| count_sum_and_number(grouped) }.flatten.compact
end

def sum_of_income_and_fills_count(key, value)
  { key.first => [value.map(&:first).sum, value.map { |x| x[1] }.sum] }
end


action_list = Parser.parse_file('./test_data/myfile.txt')

grouped_by_patient_and_drug = action_list.group_by { |action| [action[0].name, action[1].name] }
                                         .each { |_, v| v.map! { |h| [h[2]] } }

grouped_by_patient = grouped_by_patient_and_drug.map { |k, v| { k[0] => v } }

group_by_patient_with_cost = patient_with_cost(grouped_by_patient)

final_group_by = last_group_by(group_by_patient_with_cost)
# join in next line?
presenter = final_group_by.map { |x| "#{x.first}: #{x[1][1]} fills $#{x[1][0]} income" } # to pres
presenter.each { |x| p x }
