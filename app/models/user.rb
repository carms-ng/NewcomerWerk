class User < ApplicationRecord
  # cloudinary
  has_one_attached :photo
  # associations
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :services, dependent: :destroy

  # validations
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  # validates :location, inclusion: { in: ['Montreal', 'Toronto', 'Vancouver'] }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # This method to return the full name of that user
  def full_name
    first_name + " " + last_name
  end
end
