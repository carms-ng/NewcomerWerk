class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, length: { minimum: 20 }
  validates :rate, presence: true, numericality: { only_integer: true }
  validates :years_experience, numericality: { only_integer: true }

end
