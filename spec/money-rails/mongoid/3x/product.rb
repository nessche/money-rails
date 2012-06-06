class Product
  include Mongoid::Document

  field :price, :type => Money
end
