class Money
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
        if object.is_a? String
          object = Money.parse(object)
        end
        object.mongoize
      end

    end
  end
end


class Money
  include Mongoize
end