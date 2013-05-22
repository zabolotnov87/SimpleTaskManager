require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

ENV["RAILS_ENV"] = "test"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

class ActiveSupport::TestCase
  include AuthHelper
  include TestSupport
  
  require 'factory_girl_rails'
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
