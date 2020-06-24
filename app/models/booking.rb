class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start, presence: true
  validates :end, presence: true
  # validates :completed, inclusion: { in: [true, false] }

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
    self.completed = true
    self.status = "completed"
  end

  def reviewed!
    self.status = 'reviewed'
  end
end
