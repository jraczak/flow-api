class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
	has_secure_password

	has_many :tasks, dependent: :destroy

	validates_presence_of :name, :email, :password_digest
end
