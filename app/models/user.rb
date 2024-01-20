class User < ApplicationRecord
	
	has_one :reservation
	 has_secure_password
	 # Walidacja obecności i unikalności email
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Walidacja obecności i długości hasła
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
