require 'money-rails/mongoid/spec_helper'
require 'money-rails/mongoid/money'
require 'money-rails/mongoid/2x/product'

describe 'Mongoid custom Money type' do
  subject { product }

  let(:product) do { Product.create  :price => Money.new(3000, 'USD') }

  its(:price) { should be_a Money }

  specify { subject.price.cents.should == 3000 }
  specify { subject.price.currency.iso_code.should == 'USD' }
end
