module MoneyRails
	module Orm
		module Macros
			def self.included(base)
				puts "base macros: #{base}"
				base.send :include, ClassMethods
			end

			module ClassMethods
				def set_money_orm orm = :mongoid
					case orm.to_sym
					when :mongoid
						self.send :include, ::Mongoid::Document
					else
						self.send :include, ::MongoMapper::Document
					end
				end					

				def monetize_orm orm = :mongoid
					if [:mongoid, :mongo_mapper].include? orm.to_sym					
						set_money_orm orm
						self.send :include, "MoneyRails::#{orm.to_s.camelize}::Monetize".constantize						
					else
						raise ArgumentError, "ORM #{orm} has no money macro support yet"
					end
				end

				def monetizable_orm orm = :mongoid, options = {}
					if [:mongoid, :mongo_mapper].include? orm.to_sym
						set_money_orm orm
						self.send :include, "MoneyRails::#{orm.to_s.camelize}::Monetizable".constantize
						embedded_in options[:as], :polymorphic => true if options[:as]
					else
						raise ArgumentError, "ORM #{orm} has no money macro support yet"
					end
				end
			end
		end
	end
end