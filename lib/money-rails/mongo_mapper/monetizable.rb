# Thanks to: https://gist.github.com/840500
module MoneyRails
	module MongoMapper
		module Monetizable			
			include MoneyRails::Orm::Generic

			def self.included(base)
				base.class_eval do
				  key :price_pence, 	Integer, :default => 0
				  key :currency_iso, 	String,  :default => ::Money.default_currency.iso_code
				  
				  validates_numericality_of :price_pence
				end
				base.extend MoneyRails::Orm::Generic::ClassMethods
			end
		end
	end
end
