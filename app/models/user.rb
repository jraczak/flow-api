class User < ApplicationRecord
	has_many :tasks, dependent: :destroy

	validates_presence_of :email, :firebase_id
end
