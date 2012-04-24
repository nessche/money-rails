# Thanks to: https://gist.github.com/840500

module MoneyRails
	module Mongoid
		module Monetizable
			def self.included(base)
				base.class_eval do
				  field :price_pence, 	:type => Integer, :default => 0
				  field :currency_iso, 	:type => String, :default => Money.default_currency.iso_code
				  
				  validates_numericality_of :price_pence
				end
			end

			def self.monetize_one name, options = {:as => :priced}
				as_poly = options[:as] || MoneyRails.default_polymorphic_money
				unless as_poly
					raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
				end
				one name, :as => as_poly
			end

			def self.monetize_many name, options = {:as => :priced}
				as_poly = options[:as] || MoneyRails.default_polymorphic_money
				unless as_poly
					raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
				end
				many name, :as => as_poly
			end
			  
		  # Virtual price / currency attributes
		  
		  def price
		    Money.new(self.price_pence, currency)
		  end
		  def price=(price)
		    self.price_pence = price.cents
		  end

		  def currency
		    Money::Currency.new(currency_iso)
		  end	
		end
	end
end