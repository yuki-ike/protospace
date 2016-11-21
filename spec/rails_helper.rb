
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do
      FactoryGirl.reload
  end

  config.include Devise::TestHelpers, type: :controller
  # config.render_views = true
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
