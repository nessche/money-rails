module Mongoid
  MAJOR_VERSION =  Mongoid::VERSION > '3' ? 3 : 2
end

require "moeny-rails/mongoid/#{Mongoid::MAJOR_VERSION}x/money"
