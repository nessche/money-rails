module Mongoid
	module Document
		module ClassMethods
			include MoneyRails::Orm::Macros			
		end
	end
end

class Object
	MoneyRails::Moneys.macro_map.each do |method_name, klass|

	  define_method method_name do |amount, currency=nil|
	  	currency = ::Money::Currency.new(currency || ::Money.default_currency)
	  	money = Money.new(amount, currency)
	  	class_name = "#{klass}_class"
	  	MoneyRails::Moneys.send(class_name).new :price => money
	  end

	end
end
