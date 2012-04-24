module MoneyRails
	module MongoMapper
		module Monetize
			def self.included(base)
				base.extend ClassMethods				
			end

			module ClassMethods
				def monetize_one name, options = {:as => :priced}
					as_poly = options.delete(:as) || MoneyRails.default_polymorphic_money
					
					unless as_poly
						raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
					end

					self.one name.to_sym, options.merge(:as => as_poly)
				end
				alias_method :monetize, :monetize_one

				def monetize_many name, options = {:as => :priced}
					as_poly = options.delete(:as) || MoneyRails.default_polymorphic_money
					unless as_poly
						raise ArgumentError, "You must set an :as option indicating the polymorphic Monetizable model. See money-rails gem."
					end					
					self.many name, options.merge(:as => as_poly)
				end
			end # module			 
		end
	end
end