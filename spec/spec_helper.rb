ENV['ENVIRONMENT'] = 'test'

require 'rake'
require 'simplecov'
require 'simplecov-console'

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
end


# RSpec.configure do |config|
#   config.before(:all) do
#     Rake::Task['create_table_snacks'].execute
#     Rake::Task['create_table_change'].execute
#
# end


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
