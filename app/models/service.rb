class Service < ApplicationRecord
  # associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  
  # cloudinary
  has_many_attached :photos

  # validations
  validates :title, presence: true
  validates :photos, presence: true
  validates :description, length: { minimum: 20 }
  validates :rate, presence: true, numericality: { only_integer: true }
  validates :years_experience, numericality: { only_integer: true }

  # mapbox
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # pg search
  include PgSearch::Model
  pg_search_scope :global_search_by_user_service,
    against: [:title, :description, :address],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # This method returns the average rating
  def average_rating
    self.reviews.average(:rating)
  end
  
  # This method splits the address to street_name and the rest (city, state, country, etc)
  def address_lines
    pattern = /^([^,]+), (.+)$/
    match_data = self.address.match(pattern)
    return [match_data[1], match_data[2]]
  end
  
  # This method returns the count of completed bookings 
  def num_completed_booking
    self.bookings.where(status: "completed").count
  end
end
