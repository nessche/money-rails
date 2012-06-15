
  module Mongoize
    extend ActiveSupport::Concern
    # See http://mongoid.org/en/mongoid/docs/upgrading.html        

    def mongoize
      {:cents => cents, :currency_iso => currency.iso_code}
    end

    module ClassMethods
      def demongoize(value)
        ::Money.new value[:cents], value[:currency_iso]
      end


      def evolve(object)
        object.__evolve_to_money__.mongoize
      end



    end
  end



class Money
  include Mongoize

  def __evolve_to_money__
    self
  end

end