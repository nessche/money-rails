# Thanks to: https://gist.github.com/840500

module MoneyRails
	module Mongoid
		module Monetizable
			include MoneyRails::GenericOrm

			def self.included(base)
				base.class_eval do
				  field :price_pence, 	:type => Integer, :default => 0
				  field :currency_iso, 	:type => String, 	:default => ::Money.default_currency.iso_code
				  
				  validates_numericality_of :price_pence
				end
				base.extend MoneyRails::GenericOrm::ClassMethods				
			end
		end
	end
end