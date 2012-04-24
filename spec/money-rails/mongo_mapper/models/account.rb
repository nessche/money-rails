class Price
  include MongoMapper::Document
  include MoneyRails::MongoMapper::Monetizable

  belongs_to  :priced, :polymorphic => true
end

class Account
  include MongoMapper::Document

  one :rental_price, :as => :priced
  one :deposit, :as => :priced  
end
