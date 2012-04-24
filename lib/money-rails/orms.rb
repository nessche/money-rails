if defined?(ActiveRecord::Base)
	require "money-rails/active_record/monetizable" 
end

if defined?(Mongoid::Document)
	require "money-rails/mongoid/monetizable"
end

if defined?(MongoMapper::Document)
	require "money-rails/mongo_mapper/monetizable"
end

module MoneyRails
	module Orms
		def self.extend_for name = :active_record
			case name.to_sym
			when :active_record
				if defined?(ActiveRecord::Base)
					ActiveRecord::Base.send(:include, MoneyRails::ActiveRecord::Monetizable) 
				end
			else
				raise ArgumentError, "ORM extension for #{name} is currently not supported."
			end
		end

	  def self.supported
	  	%w{active_record mongoid mongo_mapper}
	  end		
  end
end
