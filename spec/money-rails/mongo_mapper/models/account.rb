class Account
  include MongoMapper::Document
	include MoneyRails::MongoMapper::Monetize

  one :deposit, :as => :priced, :class_name => 'Price'

  # monetize_one 	:rental_price

  # monetize 			:rent
  # monetize_many :costs, :class_name => 'Price'  
end
