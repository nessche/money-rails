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

      # TODO
      # def evolve(object)
      #   { "$gte" => object.first, "$lte" => object.last }
      # end
    end
  end
end


class Money
  include Mongoize
end