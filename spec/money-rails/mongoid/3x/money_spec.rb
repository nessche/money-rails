require 'money-rails/mongoid/spec_helper'
require 'money-rails/mongoid/money'
require 'money-rails/mongoid/3x/product'

describe 'Mongoid custom Money type' do

  subject { product }

  let(:product) { Product.create(:price => Money.new(3000, 'USD')) }

  its(:price) { should be_a Money }

  specify { subject.price.cents.should == 3000 }
  specify { subject.price.currency.iso_code.should == 'USD' }


  it "should be searchable by price as money" do
    Product.create(:price => Money.new(3000, 'USD'))
    Product.where(price: Money.new(3000, 'USD')).count.should == 1
  end

  it "should be searchable by price as string" do
    product
    Product.where(price: "USD 30.00").count.should == 1
  end

  it "should be searchable by price using gte and a money value of same currency" do
    product
    Product.where(:price.gte => Money.new(2000, 'USD')).count.should == 1
  end

  it "should be searchable by price using gte and a money value of different currency" do
    Money.add_rate("USD","EUR",0.5)
    Money.add_rate("EUR","USD",2)
    product
    # with our rates 20 EUR -> 40 USD
    Product.where(:price.gte => Money.new(2000, 'EUR')).count.should == 0
  end

end
