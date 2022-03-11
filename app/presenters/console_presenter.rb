class ConsolePresenter
  def self.output(result)
    result.flatten.each_slice(2) do |name, values|
      parient_name = name
      fills_count = values[:count]
      income_value = values[:income]

      $stdout.puts("#{parient_name}: #{fills_count} fills $#{income_value} income")
    end
  end
end
