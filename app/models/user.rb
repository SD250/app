class User < ApplicationRecord
  has_one :reservation

  # has_secure_password używa bcrypt do bezpiecznego przechowywania haseł
  has_secure_password

  # Walidacja obecności i unikalności email
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  # Możesz dodać inne walidacje zgodnie z potrzebami aplikacji
end