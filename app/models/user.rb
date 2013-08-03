class User < ActiveRecord::Base

	attr_accessible :avatar, :biography, :email, :first_name, :last_name, :location, :role, :username, :password,:password_confirmation

	has_secure_password

	mount_uploader :avatar, AvatarUploader

	validates :first_name, presence: true, length:{minimum:2}
	validates :last_name, presence: true, length:{minimum:2}
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
	validates :password, presence: true, length:{in:(6..20), message: "Your password should be 6 to 20 characters long."}
	validates :password_confirmation, presence: true
	validates :biography, length: {maximum: 250,
		too_long: "%{count} characters is the maximum allowed." }

	has_many :comments
	has_many :albums, dependent: :destroy
	has_many :photos, through: :albums, dependent: :destroy

 	accepts_nested_attributes_for :albums

	def role?(role)
 		self.role == role
	end

end
