class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :comments
  attr_accessible :description, :name, :photo_picture

  mount_uploader :photo_picture, PhotoPictureUploader
end
