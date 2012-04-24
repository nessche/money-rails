require 'spec_helper'

require 'mongo_mapper'
require 'money-rails/mongoid/models/monetized_account'

describe MoneyRails::Mongoid::Monetizable do

  describe "monetize" do
    before :each do
      @account = MonetizedAccount.create(:price_cents => 3000, :discount => 150,
                                :bonus_cents => 200)
    end

    it "attaches a Money object to model field" do
      @account.price.should == Money.new(3000)
    end

    it "respects :target_name argument" do
      @account.discount_value.should == Money.new(150)
    end

    it "overrides table currency with a field specific" do
      @account.bonus.currency.should == Money::Currency.find(:eur)
    end
  end
end


