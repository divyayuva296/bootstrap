class User < ApplicationRecord
	has_many :students
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },uniqueness: true
  validates :password, length: {minimum: 6},presence: true
  validates :password, confirmation: {case_sensitive: true}
  # validates :password, presence: true
end
