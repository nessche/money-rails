require 'spec_helper'
require 'mongoid'

require 'money-rails/mongoid/mongoid_setup'

Mongoid.configure do |config|
  Mongoid::VersionSetup.configure config
end

if RUBY_VERSION >= '1.9.2'
  YAML::ENGINE.yamler = 'syck'
end

RSpec.configure do |config|
  # config.mock_with(:mocha)

  config.before(:each) do
    Mongoid.purge!
    # Mongoid.database.collections.each do |collection|
    #   unless collection.name =~ /^system\./
    #     collection.remove
    #   end
    # end
  end
end

require 'money-rails'

MoneyRails.default_polymorphic_money = :priced

MoneyRails::Orms.extend_for :mongoid

require 'money-rails/mongoid/models/price'
require 'money-rails/mongoid/models/account'

require 'money-rails/shared/generic_account_ex'
