task :default do
  failures = `grep "rspec ./spec" | grep --color=auto -o '\\s.*\\.rb\\(:\\d\\+\\)\\?'`

  if failures.include?('_spec')
    sh "bundle exec rspec #{failures.delete("\n")}"
  else
    puts 'No failing tests found.'
  end
end
