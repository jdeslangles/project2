class User < ActiveRecord::Base
  attr_accessible :avatar, :biography, :email, :first_name, :last_name, :location, :password_digest, :role, :username
  has_many :comments
  has_many :albums
  has_many :photos, through: :albums

  mount_uploader :avatar, AvatarUploader
end
