class MonetizedAccount
	include MongoMapper::Document
	include MoneyRails::MongoMapper::Monetizable

	monetize_one :rental_price
	monetize_many :deposits

	monetize :secret_price, :as => :priced

	monetize_for :low_price, :high_price

	# Using a custom Monetizable model
	monetize_one :total_cost, :as => :costable	
end
