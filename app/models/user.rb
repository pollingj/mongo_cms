class User
  include MongoMapper::Document
  plugin Plugins::AuthlogicModel

  acts_as_authentic do |config|
    config.login_field = 'username'
    config.instance_eval do
      validates_uniqueness_of_login_field_options :scope => '_id', :case_sensitive => true
    end
  end

  timestamps!
 
end
