class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_validation :downcase_username
  before_validation :set_default_role

  devise :database_authenticatable, :registerable, :omniauthable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, omniauth_providers: [:google_oauth2]

  acts_as_voter

	attr_accessible :avatar, :biography, :email, :first_name, :last_name, :location, :role, :username, :password,:password_confirmation, :provider, :uid, :remember_me

	mount_uploader :avatar, AvatarUploader

	validates :first_name, presence: true, length:{minimum:2}
	validates :last_name, presence: true, length:{minimum:2}
	validates :username, presence: true, uniqueness: true
	# validates :email, presence: true, uniqueness: true => on: :create
	validates :biography, length: {maximum: 250,
		too_long: "%{count} characters is the maximum allowed." }

      validate :avatar_size_validation


	has_many :comments
	has_many :albums, dependent: :destroy
	has_many :photos, through: :albums, dependent: :destroy

	accepts_nested_attributes_for :albums

  def self.find_for_authentication(conditions)
    conditions[:username].downcase!
    super(conditions)
  end

	def role?(role)
		self.role == role
	end

  private
  def downcase_username
    self.username.downcase! if self.username
  end

  private
  def set_default_role
    self.role ||= 'registered'
  end


  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 1MB" if avatar.size > (1.2).megabyte
  end

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.username = auth.info.email
      end
    end
  end



end
