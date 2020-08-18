class Review < ApplicationRecord
  # associations
  belongs_to :booking

  # validations
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :content, presence: true

  # This method returns the user that books the service (not the one who provides the service)
  def user
    booking.user
  end
end
