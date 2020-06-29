class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :description, length: { minimum: 20 }
  validates :rate, presence: true, numericality: { only_integer: true }
  validates :years_experience, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    self.reviews.average(:rating)
  end

  def address_lines
    pattern = /^([^,]+), (.+)$/
    match_data = self.address.match(pattern)
    return [match_data[1], match_data[2]]
  end

  def num_completed_booking
    self.bookings.where(status: "completed").count
  end
end
