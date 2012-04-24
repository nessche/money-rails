require 'spec_helper'
require 'mongo_mapper'

MongoMapper.database = 'money-rails'

MongoMapper.database.collections.each do |coll|
  coll.drop unless coll.name =~ /(.*\.)?system\..*/
end    


module Database
  def self.teardown
    # MongoMapper.database.collections.each {|collection| collection.drop }    
    MongoMapper.database.collections.each do |coll|
      coll.drop unless coll.name =~ /(.*\.)?system\..*/
    end    
  end
end

require 'money-rails'

MoneyRails.default_polymorphic_money = :priced

require 'money-rails/mongo_mapper/models/price'
require 'money-rails/mongo_mapper/models/account'

require 'money-rails/shared/generic_account_ex'


