require 'capybara/rspec'

Capybara.register_driver :chrome_headless do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 clear_session_storage: true,
                                 clear_local_storage: true,
                                 capabilities: [Selenium::WebDriver::Chrome::Options.new(
                                   args: %w[headless disable-gpu no-sandbox window-size=1024,768]
                                 )]
end

Capybara.server = :puma
Capybara.default_driver = :selenium_chrome_headless
Capybara.javascript_driver = :selenium_chrome_headless

# Capybara.register_driver :chrome do |app|
#  Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.default_driver = :chrome
# Capybara.javascript_driver = :chrome

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
