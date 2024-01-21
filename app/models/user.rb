class User < ApplicationRecord
  has_one :reservation

  # has_secure_password używa bcrypt do bezpiecznego przechowywania haseł
  has_secure_password

  # Walidacja obecności i unikalności email
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # Atrybut wskazujacy czy użytkownik ma uprawnienia administratora
  attribute :admin, default: false
  def admin?
    admin
  end
  # Możesz dodać inne walidacje zgodnie z potrzebami aplikacji
end