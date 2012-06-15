module Mongoid
  MAJOR_VERSION =  Mongoid::VERSION > '3' ? 3 : 2
end

require "money-rails/mongoid/#{Mongoid::MAJOR_VERSION}x/money"
require "money-rails/mongoid/extensions/string"
