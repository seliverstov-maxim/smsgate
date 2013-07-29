class User < ActiveRecord::Base
  attr_accessible :api_key, :password
  has_secure_password

  validates :password_digest, presence: true
end