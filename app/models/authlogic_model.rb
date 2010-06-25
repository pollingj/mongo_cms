class Validatable::ValidatesNumericalityOf
  option :greater_than, :greater_than_or_equal_to

  def valid?(instance)
    value = value_for(instance)

    return true if allow_nil && value.nil?
    return true if allow_blank && value.blank?
    return false if !self.greater_than.nil? && value.to_f <= self.greater_than
    return false if !self.greater_than_or_equal_to.nil? && value.to_f < self.greater_than_or_equal_to
    regex = self.only_integer ? /\A[+-]?\d+\Z/ : /^\d*\.{0,1}\d+$/

    value.to_s =~ regex
  end
end

module Plugins::AuthlogicModel
  def self.configure(model)
    model.class_eval do
      key :username, String
      key :email, String
      key :crypted_password, String
      key :password_salt, String
      key :persistence_token, String
      key :login_count, Integer, :default => 0
      key :last_request_at, Time
      key :last_login_at, Time
      key :current_login_at, Time
      key :last_login_ip, String
      key :current_login_ip, String

      include Authlogic::ActsAsAuthentic::Base
      include Authlogic::ActsAsAuthentic::Email
      include Authlogic::ActsAsAuthentic::LoggedInStatus
      include Authlogic::ActsAsAuthentic::Login
      include Authlogic::ActsAsAuthentic::MagicColumns
      include Authlogic::ActsAsAuthentic::Password
      include Authlogic::ActsAsAuthentic::PerishableToken
      include Authlogic::ActsAsAuthentic::PersistenceToken
      include Authlogic::ActsAsAuthentic::RestfulAuthentication
      include Authlogic::ActsAsAuthentic::SessionMaintenance
      include Authlogic::ActsAsAuthentic::SingleAccessToken
      include Authlogic::ActsAsAuthentic::ValidationsScope
    end
  end

  module ClassMethods
    def base_class
      self
    end

    def primary_key
      :id
    end

    def default_timezone
      :utc
    end

    def with_scope(query)
      query = where(query) if query.is_a?(Hash)
      yield query
    end

    def named_scope(*args, &block)
      scope *args, &block
    end
  end

  module InstanceMethods
    def save(options = {})
      unless options.is_a?(Hash)
        options = {:validate => options}
      end

      super(options)
    end

    def readonly?
      false
    end
  end
end