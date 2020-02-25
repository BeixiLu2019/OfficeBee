class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :offices, dependent: :destroy
  # validates :last_name, presence: true
  # validates :first_name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
