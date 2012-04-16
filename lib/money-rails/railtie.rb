module MoneyRails
  module Monetizable
    class Railtie < ::Rails::Railtie
			[:active_record, :mongoid, :mongo_mapper, :data_mapper, :sequel].each do |orm|
		  	MoneyRails::Orm.send(orm)
		  end		  
    end
  end
end
