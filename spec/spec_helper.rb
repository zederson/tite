require 'recursive-open-struct'

require 'tite'

require 'rspec'
require 'rspec/its'
require 'factory_girl'
require 'faker'
require 'faraday'

require 'pry'
require 'json_spec'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation
  config.include FactoryGirl::Syntax::Methods

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  root = File.expand_path('../', __FILE__)

  Dir["#{root}/support/*.rb"].each do |helper|
    helper_name = File.basename(helper, '.rb')

    require "#{root}/support/#{helper_name}"
    config.include(helper_name.camelize.constantize) if helper_name.include?('helper')
  end

  JsonSpec.directory = "#{root}/fixtures/json"

  config.before(:all) do
    # Tite::Configuration.load_file 'spec/tite.yml'
  end
end
