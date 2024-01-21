class Desk < ApplicationRecord
  has_one :reservation

  # Walidacja obecności, unikalności oraz formatu nazwy
  validates :name, presence: true, 
                   uniqueness: true, 
                   format: { with: /\A[a-zA-Z0-9]+\z/, message: "może zawierać tylko litery i cyfry" }

  # Walidacja obecności lokalizacji
  validates :location, presence: true,
                       uniqueness: true

            # Walidacja obecności i zawartości statusu
  validates :status, presence: true, 
                     inclusion: { in: ['dostępne', 'zajęte'], message: "%{value} nie jest poprawnym statusem" }
end
