class User < ActiveRecord::Base
has_secure_password
validates :email, presence: true #, uniquness: true

  attr_accessible :avatar, :biography, :email, :first_name, :last_name, :location, :role, :username, :password,:password_confirmation
  has_many :comments
  has_many :albums
  has_many :photos, through: :albums
end
