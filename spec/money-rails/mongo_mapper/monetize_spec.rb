require 'money-rails/mongo_mapper/spec_helper'

describe MoneyRails::MongoMapper::Monetizable do
  before do
    Money.default_currency = 'USD'
  end

  describe "monetize" do
    subject { account }

    let(:account) do
      Account.create  :rental_price => Price.for(3000, :usd) #, 
                      # :deposit => Price.for(150, :usd), 
                      # :rent => Price.for(100)
    end

    it "rental is money" do
      subject.rental_price.price.should == Money.new(3000)
    end

    # it_behaves_like 'a generic account'

    # context 'can add multiple costs' do     
    #   before do
    #     account.costs << Price.for(100, :usd)
    #     account.costs << Price.for(200)
    #   end

    #   its(:costs) { should have(2).items }
    # end
  end
end
