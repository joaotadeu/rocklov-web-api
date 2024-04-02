require "cucumber"
require "capybara/cucumber"
require "site_prism"
require 'report_builder'
#require 'allure-cucumber'
require 'mongo'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 5
end

# AllureCucumber.configure do |config|
#     config.results_directory = "/logs"
#     config.clear_results_directory = true
# end