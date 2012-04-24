module MoneyRails
  module Monetizable
    class Railtie < ::Rails::Railtie
		  MoneyRails::Orms.extend_for :active_record
    end
  end
end
