require 'active_record'

# Establish DB connection
path = File.dirname(__FILE__) + '/db/database.yml'
dbconfig = YAML::load File.open(path)
ActiveRecord::Base.establish_connection(dbconfig)

# Migrate DB
migration_dir = SPEC_DIR + '/dummy/db/migrate'
ActiveRecord::Migrator.migrate migration_dir

require 'money-rails'

MoneyRails::Orms.extend_for :active_record
