class User < ActiveRecord::Base
  attr_accessible :email, :name, :second_name, :third_name, :api_key, :password
  has_secure_password

  validates :password_digest, presence: true
  validates :email, presence: true,
                    length: { minimum: 3, maximum: 255 },
                    uniqueness: { case_sensitive: true }
  validates :name, length: { maximum: 255 }
  validates :second_name, length: { maximum: 255 }
  validates :third_name, length: { maximum: 255 }

# NOTICE: stoped, if user was stoped by spam control system
# NOTICE: blocked, if user was stoped by admin
  state_machine :state, initial: :new do
    state :new
    state :email_verification
    state :sms_verifivation
    state :active
    state :removed
    state :blocked
    state :stoped

    event :email_verificate do
      transition :new => :email_verification
    end

    event :sms_verifivate do
      transition :email_verification => :sms_verifivation
    end

    event :activate do
      transition :sms_verifivation => :active
    end

    event :remove do
      transition :active => :removed
    end

    event :block do
      transition any => :block
    end

    event :stop do
      transition any => :block
    end
  end
end