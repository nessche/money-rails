module MoneyRails
	module Moneys
		class << self		
			[:value, :price, :cost].each do |klass|
				name = "#{klass}_class"

				# define attr writer
				self.send(:attr_writer, name)

			# define getter
				define_method name do
					var_name = :"@#{name}"
					unless instance_variable_get(var_name)
					 	instance_variable_set(var_name, klass.to_s.camelize.constantize)
					end
					instance_variable_get(var_name)
				end
			end

			def macro_map
				{
					:costing => :cost,
					:priced_at => :price,
					:valued_at => :value
				}
			end
		end
	end
end