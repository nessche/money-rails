source :rubygems

# Add dependencies required to use your gem here.
gem 'money', 					"~> 5.2.1", :git => 'git://github.com/kristianmandrup/money.git'
gem 'activesupport', 	">= 3.0"
gem 'railties', 			">= 3.0"

group :test do
	gem 'mongoid',       "3.0.0.rc"
	gem 'mongo_mapper'
	gem 'bson'
	gem 'bson_ext'

	gem 'activerecord'
  gem 'sqlite3'
end	

group :development, :test do
  gem 'rails', 				">= 3.0"
  gem 'rspec'
	gem 'rspec-rails'
end

group :development do
  gem 'bundler', 			">= 1.0.0"
end
