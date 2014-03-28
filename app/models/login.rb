class Login < ActiveRecord::Base

  attr_accessor :email, :password

  belongs_to :user
  validates_presence_of :user

  MAX_SESSION_LENGTH = 1.year

  after_create :generate_keys, :set_expiry

  private

    def generate_keys
      self.session_key = String.random_alphanumeric( rand(128) + 128 )
      self.save
    end

    def set_expiry
      self.expires = Time.now + MAX_SESSION_LENGTH
      self.save
    end

    def add_key_to_session
      session[:session_key] = self.session_key
    end

    def remove_key_from_session
      session[:session_key] = nil
    end

end

