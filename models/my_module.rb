module MyModule
  # Group patient and drug with event
  # ["Nick", "A"]=>[#<Event:0x00007fb95194aa40 @name="created">]
  def grouped_by_patient_and_drug(action_list)
    action_list.map(&:create_array_of_action).group_by { |action| [action[0], action[1]] }
                                             .each { |_, value| value.map! { |action| action[2] } }
  end

  # Since we have already grouped by patients and medicines, we do not need to store medicines
  # ["Nick", "A"]=>[#<Event:0x00007f9e0e0d84d8 @name="created">]
  # {"Nick"=>[#<Event:0x00007f9e0e0d84d8 @name="created">]}
  def grouped_by_patient(grouped)
    grouped.map { |key, value| { key[0] => value } }
  end

  # Returns a grouped hash where the key is the patient's name and the value is an array of sum values and their counts
  # { "Mark" => [9, 2] }
  def group_by_sum_and_numbers(hash)
    events_after_created = delete_events_before_created(hash)
    return unless events_after_created

    { hash.keys.first => [events_after_created.map(&:filled_sum).sum, events_after_created.map(&:filled_count).sum] }
  end

  # This method returns only arrays of sum values and their counts
  # {["Nick"]=>[{"Nick"=>[0, 0]}], ["Mark"]=>[{"Mark"=>[9, 2]}], ["John"]=>[{"John"=>[-1, 0]}]}
  # [["Nick"]=>[0, 0], ["Mark"]=>[9, 2], ["John"]=>[-1, 0]]
  def remove_dublicated_names_from_hash_values(grouped)
    grouped.each { |_, v| v.map!(&:values).flatten! }
  end

  # As a result of executing this method, we get an array of events that occurred after created
  def delete_events_before_created(hash)
    created_index = hash.map { |_, v| v.flatten.map(&:name).find_index('created') }.first
    return unless created_index

    hash.map { |_, v| v.flatten[created_index + 1..-1] }.flatten
  end
end
