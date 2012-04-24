# RubyMoney - Money-Rails

[![Build Status](https://secure.travis-ci.org/RubyMoney/money-rails.png?branch=master)](http://travis-ci.org/RubyMoney/money-rails)

## Introduction

This library provides integration of [money](http://github.com/Rubymoney/money) gem with Rails.

Use 'monetize' to specify which fields you want to be backed by
Money objects and helpers provided by the [money](http://github.com/Rubymoney/money)
gem.

## Installation

Add this line to your application's Gemfile:

    gem 'money-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install money-rails


## Usage

For example, we create a Product model which has an integer price_cents column
and we want to handle it by using a Money object instead:

```ruby
class Product < ActiveRecord::Base
  
  monetize :price_cents
  
end
```

Now each Product object will also have an attribute called ```price``` which
is a Money object and can be used for money comparisons, conversions etc.

In this case the name of the money attribute is created automagically by removing the
```_cents``` suffix of the column name. If you prefer another name for the
money attribute, then you can provide ```target_name``` argument with a string
value to the ```monetize``` macro:

```ruby
monetize :discount, :target_name => "discount_value"
```

Now the model objects will have a ```discount_value``` attribute which
is a Money object, wrapping the value of ```discount``` column to a
Money instance.

## ORM support

Money-Rails now supports integration with ActiveRecord, Mongoid and MongoMapper. It should be easy to integrate the ORM of your choice if you look at the sample adapters.

To get a list of supported ORMs:

`MoneyRails::Orms.supported`

The Mongoid and MongoMapper integrations will add the following methods:

* price_pence (Integer)
* price= (Money)
* price (Money)
* currency (Money::Currency)
* currency_iso (String)

I order to add multiple prices (money items) to a model, create a generic, polymorphic Price model and embed instances of it with different names.

### Mongoid example

```ruby
class Account
	include Mongoid::Document
	include MoneyRails::Mongoid::Monetizable
end
```

Multiple prices:

```ruby
class Price
	include Mongoid::Document
	include MoneyRails::Mongoid::Monetizable

	embedded_in :priced, :polymorphic => true
end

class Account
	include Mongoid::Document

	embeds_one :rental_price, :as => :priced
	embeds_one :deposit, :as => :priced	
end
```

### MongoMapper example

```ruby
class Account
	include Mongoid::Document
	include MoneyRails::MongoMapper::Monetizable
end
```

A similar "multiple price" model can be used for MongoMapper.

```ruby
class Price
	include Mongoid::Document
	include MoneyRails::Mongoid::Monetizable

	belongs_to 	:priced, :polymorphic => true
end

class Account
	include Mongoid::Document

	one :rental_price, :as => :priced
	one :deposit, :as => :priced	
end
```

## For convenience

To make it more convenient and feel more like the ActiveRecord DSL, we provide
similar convenience methods:

* monetize_one
* monetize_many

```ruby
# in initializer or some other place

MoneyRails.default_polymorphic_money = :priced

# later in your models
class Account
	include Mongoid::Document

	monetize_one :rental_price
	monetize_many :deposits

	# Using a custom Monetizable model
	monetize_one :total_cost, :as => :costable	
end
```

## License

MIT License. Copyright 2012 RubyMoney.
