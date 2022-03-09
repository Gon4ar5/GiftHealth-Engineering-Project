require "./services/parser"

action_list = Parser.parse_file("./test_data/myfile.txt")

grouped_by_patient_and_drug = action_list.group_by { |el| [el[0].name, el[1].name] }.each{|k, v| v.map!{|h| [h[2].name] }}

grouped_by_patient = grouped_by_patient_and_drug.map {|k, v| { k[0] => v } }

group_by_patient_with_cost = grouped_by_patient.map do |x| 
  x.map do |k, v|
    i = v.flatten.find_index("created")
    i ? v.delete_if.with_index {|x, index| index <= i } : next
    fills_count = 0 # count fills
    sum = v.map{|x| x.first == 'filled' ? 5 : -6 }.sum
    count = v.map{|x| x.first == 'filled' ? 1 : -1 }.sum
    { k => [sum, count] }
  end
end

final_group_by = group_by_patient_with_cost.flatten.compact.group_by{|k, v| k.keys}.each{|k, v| v.map!{|h| h.values.flatten }}.map{|k, v| { k.first => [v.map(&:first).sum, v.map{|x| x[1]}.sum] }}
presenter = final_group_by.map {|x| "#{x.first.first}: #{x.first[1][1]} fills $#{x.first[1][0]} income" }
presenter.each {|x| p x}
#p grouped_by_patient
#p group_by_patient_with_cost
#p final_group_by