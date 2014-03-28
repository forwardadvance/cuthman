class User < ActiveRecord::Base

  has_secure_password


  MAX_EMAIL = MAX_PASSWORD = MAX_NAME = 255
  EMAIL_REGEX = /.+@.+\..+/
  PASSWORD_REGEX = /\S*/

  validates :name, length: { maximum: MAX_NAME }

  validates_presence_of     :email, message: "Please enter your email"
  validates_length_of       :email, within: 6..MAX_EMAIL, message: "Your email should be at least 6 characters long"
  validates_format_of       :email, :with => EMAIL_REGEX, :message => "Your email address doesn't look valid"
  validates_uniqueness_of   :email, message: "There is already an account with this email"

  validates_presence_of     :password, message: "Please choose a password"
  validates_presence_of     :password_confirmation, message: "Please confirm your password"
  validates_length_of       :password, within: 4..MAX_PASSWORD, message: "Your password should more than 4, and less than #{MAX_PASSWORD} characters long"
  validates_confirmation_of :password, message: "your password confirmation doesn't match"
  validates_format_of       :password, with: PASSWORD_REGEX, message: "Your password must not contain spaces"

end
