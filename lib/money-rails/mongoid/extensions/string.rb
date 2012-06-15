# encoding: utf-8
module Mongoid
  module Extensions
    module String

      def __evolve_to_money__
        Money.parse(self)
      end

    end
  end
end

::String.__send__(:include, Origin::Extensions::String)