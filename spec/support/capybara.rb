# frozen_string_literal: true

Capybara.configure do |config|
  config.javascript_driver = :selenium_chrome
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: [
          'window-size=1024,768'
        ]
      }
    )
  )
end
