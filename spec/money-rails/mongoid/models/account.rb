class Account
	include Mongoid::Document
	# include MoneyRails::Mongoid::Monetize
	monetize_orm :mongoid

  monetize_for  :utility, :services

  embeds_one 		:deposit, 			:as => :priced  
  monetize_one 	:rental_price

  monetize 			:rent
  monetize_many :costs, :class_name => 'Price'
end
