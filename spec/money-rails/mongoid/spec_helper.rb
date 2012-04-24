require 'spec_helper'
require 'mongoid'
require 'bson'

Mongoid.configure.master = Mongo::Connection.new.db('money-rails')

Mongoid.database.collections.each do |coll|
  coll.remove
end

require 'money-rails'

MoneyRails.default_polymorphic_money = :priced

MoneyRails::Orms.extend_for :mongoid

# puts Class.methods.grep /as_/

require 'money-rails/mongoid/models/price'
require 'money-rails/mongoid/models/account'

require 'money-rails/shared/generic_account_ex'
