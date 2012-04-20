module MoneyRails
  module Monetizable
    class Railtie < ::Rails::Railtie
			[:active_record].each do |orm|
		  	MoneyRails::Orm.send(orm)
		  end

		  def self.orms
		  	[:active_record, :mongoid, :mongo_mapper, :data_mapper, :sequel]
		  end
    end
  end
end
