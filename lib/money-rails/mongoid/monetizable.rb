# Thanks to: https://gist.github.com/840500

module MoneyRails
	module Mongoid
		module Monetizable
			def self.included(base)
				base.class_eval do
				  field :price_pence, 	:type => Integer, :default => 0
				  field :currency_iso, 	:type => String, 	:default => ::Money.default_currency.iso_code
				  
				  validates_numericality_of :price_pence
				end
				base.extend ClassMethods
			end

			module ClassMethods
				def monetize_one name, options = {:as => :priced}
					as_poly = options[:as] || MoneyRails.default_polymorphic_money
					unless as_poly
						raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
					end
					embeds_one name, :as => as_poly					
				end
				alias_method :monetize, :monetize_one

				def monetize_for *names, options = {:as => :priced}
					names.each {|name| monetize name, options }
				end

				def monetize_many name, options = {:as => :priced}
					as_poly = options[:as] || MoneyRails.default_polymorphic_money
					unless as_poly
						raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
					end
					embeds_many name, :as => as_poly					
				end
			end # module
			  
		  # Virtual price / currency attributes
		  
		  def price
		    ::Money.new(self.price_pence, currency)
		  end
		  def price=(price)
		    self.price_pence = price.cents
		  end

		  def currency
		    ::Money::Currency.new(currency_iso)
		  end	
		end
	end
end