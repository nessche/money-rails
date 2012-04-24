class Price
  include Mongoid::Document
  include MoneyRails::Mongoid::Monetizable

  embedded_in :priced, :polymorphic => true

  def self.for amount, currency = nil
  	currency = ::Money::Currency.new(currency || ::Money.default_currency)
  	money = Money.new(amount, currency)
  	Price.new :price => money
  end
end
