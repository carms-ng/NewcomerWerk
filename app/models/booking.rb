class Booking < ApplicationRecord
  # associations
  belongs_to :service
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # validations
  validates :start, presence: true
  validates :end, presence: true

  # the methods below updates the status of that booking instance
  def accepted!
    self.status = 'accepted'
  end

  def declined!
    self.status = 'declined'
  end

  def canceled!
    self.status = 'canceled'
  end

  def completed!
    self.status = "completed"
  end

  def reviewed!
    self.status = 'reviewed'
  end
end
