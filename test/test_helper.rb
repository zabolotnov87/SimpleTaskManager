require 'coveralls'
Coveralls.wear!('rails')

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  include AuthHelper

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
