module MoneyRails
	module Orm
		module Macros
			def self.included(base)
				base.extend ClassMethods
			end

			module ClassMethods
				def monetize_orm orm = :mongoid
					if [:mongoid, :mongo_mapper].include? orm.to_sym					
						self.send :include, "MoneyRails::#{orm.to_s.camelize}::Monetize".constantize
					else
						raise ArgumentError, "ORM #{orm} has no money macro support yet"
					end
				end

				def monetizable_orm orm = :mongoid
					if [:mongoid, :mongo_mapper].include? orm.to_sym					
						self.send :include, "MoneyRails::#{orm.to_s.camelize}::Monetizable".constantize
					else
						raise ArgumentError, "ORM #{orm} has no money macro support yet"
					end
				end
			end
		end
	end
end