class Price
  include Mongoid::Document
  include MoneyRails::Mongoid::Monetizable

  belongs_to  :priced, :polymorphic => true
end

class Account
  include MongoMapper::Document

  one :rental_price, :as => :priced
  one :deposit, :as => :priced  
end
