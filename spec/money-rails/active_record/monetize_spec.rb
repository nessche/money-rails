require 'spec_helper'
require 'money-rails/active_record/spec_helper'

class Product < ActiveRecord::Base

  attr_accessible :price_cents, :discount, :bonus_cents

  # Use money-rails macros
  monetize :price_cents

  # Use a custom name for the Money attribute
  monetize :discount, :target_name => "discount_value"

  # Override default currency (USD) with a specific one (EUR) for this field only
  monetize :bonus_cents, :field_currency => :eur

end


describe MoneyRails::ActiveRecord::Monetizable do

  describe "monetize" do
    before :each do
      @product = Product.create(:price_cents => 3000, :discount => 150,
                                :bonus_cents => 200)
    end

    it "attaches a Money object to model field" do
      @product.price.should == Money.new(3000)
    end

    it "respects :target_name argument" do
      @product.discount_value.should == Money.new(150)
    end

    it "overrides table currency with a field specific" do
      @product.bonus.currency.should == Money::Currency.find(:eur)
    end
  end
end
