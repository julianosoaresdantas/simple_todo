# spec/rails_helper.rb

# This file is auto-generated by rspec-rails and contains some common setup to be used by all tests.
# The suite is configured with a reference to the spec helper (spec_helper.rb) that contains
# more basic config.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'shoulda/matchers' # Added for shoulda-matchers
require 'factory_bot_rails' # Added for Factory Bot
require 'database_cleaner/active_record' # Added for DatabaseCleaner

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# automatically loaded by RSpec.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

# spec/rails_helper.rb
# ... (other requires and configurations) ...

RSpec.configure do |config|
  # ... (existing configurations) ...

  # Configure Capybara for feature tests
  config.include Capybara::DSL

  # Devise test helpers for feature tests
  config.include Warden::Test::Helpers # Provides login_as, logout_as
  # Enable Warden's test mode for Devise authentication
  config.before :each, type: :feature do
    Warden.test_mode!
  end
  # After tests, revert Warden to normal mode
  config.after :each, type: :feature do
    Warden.test_reset!
  end

  # ... (rest of your configurations, e.g., database_cleaner) ...
end

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # rspec-rails can automatically fill the ActiveRecord record ID and
  # type into the `id` and `type` fields of an example `params` hash.
  #
  # This is only required if you use `config.infer_spec_type_from_file_location!`
  # and want to use Rails's own convention for `controller`, `view`, and
  # `request` specs.
  #
  # config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, use the `--seed` option to RSpec.
  #
  # config.order = :random
  # config.seed = 42

  # RSpec Rails can automatically infer spec type from file location, but
  # can be explicitly configured.
  # config.infer_spec_type_from_file_location!

  # config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gemname")

  # ----------------------------------------------------------------------
  # START ADDITIONS FOR OTHER GEMS (as discussed)
  # ----------------------------------------------------------------------

  # Factory Bot configuration
  config.include FactoryBot::Syntax::Methods

  # Shoulda Matchers configuration
  Shoulda::Matchers.configure do |shoulda_config|
    shoulda_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  # Database Cleaner configuration
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # ----------------------------------------------------------------------
  # END ADDITIONS FOR OTHER GEMS
  # ----------------------------------------------------------------------
end
