# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem 'mongo_mapper'
  config.gem 'inherited_resources'
  config.gem 'formtastic'
  config.gem "cancan"
  config.gem "authlogic"
  config.gem 'pickle'
  config.gem 'culerity'
  
  config.frameworks -= [:active_record]
 
end

MongoMapper.database = "mongocms-#{Rails.env}"
