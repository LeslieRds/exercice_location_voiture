class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :brand, presence: true, length: { minimum: 3 }
  validates :address, presence: true
end
