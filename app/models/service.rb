class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, length: { in: 20..40 }
  validates :rate, presence: true, numericality: true
  validates :years_experience, numericality: true

end
