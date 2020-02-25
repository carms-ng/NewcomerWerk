class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :services, dependent: :destroy

  # TODO: validation
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :location, inclusion: { in: ['Montreal', 'Toronto', 'Vancouver'] }, allow_nil: true
  validates :first_name, :last_name, :location, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
