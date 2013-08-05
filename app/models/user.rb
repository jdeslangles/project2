class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	acts_as_voter

	attr_accessible :avatar, :biography, :email, :first_name, :last_name, :location, :role, :username, :password,:password_confirmation, :remember_me

	mount_uploader :avatar, AvatarUploader

	validates :first_name, presence: true, length:{minimum:2}
	validates :last_name, presence: true, length:{minimum:2}
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
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
