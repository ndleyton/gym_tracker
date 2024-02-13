ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Devise test helpers available to integration tests
  include Devise::Test::IntegrationHelpers
end

# Uncomment and modify if you're using system tests
# class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
#   include Devise::Test::IntegrationHelpers
#   driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
# end
