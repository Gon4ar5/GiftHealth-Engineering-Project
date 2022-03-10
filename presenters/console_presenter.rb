class ConsolePresenter
  def self.output(result)
    result.map do |action|
      parient_name = action.first.first
      fills_count = action[1][1]
      income_value = action[1][0]

      STDOUT.puts("#{parient_name}: #{fills_count} fills $#{income_value} income")
    end
  end
end
