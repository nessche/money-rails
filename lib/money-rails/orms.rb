require "money-rails/orm/generic" 
require "money-rails/orm/macros"

if defined?(ActiveRecord::Base)
	require "money-rails/active_record/monetizable" 
end

if defined?(Mongoid::Document)
	require "money-rails/mongoid/monetizable"
	require "money-rails/mongoid/monetize"

end

if defined?(MongoMapper::Document)
	require "money-rails/mongo_mapper/monetizable"
	require "money-rails/mongo_mapper/monetize"
end

module MoneyRails

	class << self
		attr_accessor :default_polymorphic_money
	end

	module Orms
		def self.extend_for name = :active_record
			case name.to_sym
			when :active_record
				if defined?(::ActiveRecord::Base)
					::ActiveRecord::Base.send(:include, MoneyRails::ActiveRecord::Monetizable) 
				end
			when :mongoid
				require 'money-rails/mongoid/macros'
			when:mongo_mapper
				require 'money-rails/mongo_mapper/macros'
			else
				raise ArgumentError, "ORM extension for #{name} is currently not supported."
			end
		end

	  def self.supported
	  	%w{active_record mongoid mongo_mapper}
	  end		
  end
end
