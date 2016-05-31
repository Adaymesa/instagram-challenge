class User < ActiveRecord::Base
	has_many :pictures
	validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
end
