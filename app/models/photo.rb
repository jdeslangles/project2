class Photo < ActiveRecord::Base
  acts_as_votable

  attr_accessible :description, :name, :photo_picture, :album_id

  mount_uploader :photo_picture, PhotoPictureUploader

  validates :name, presence: true
  validates :description, length:{ maximum: 250,
  	too_long: "%{count} characters is the maximum allowed."}
  validates :photo_picture, presence: true

  validate :photo_picture_size_validation

  belongs_to :album
  has_many :comments


  private
  def photo_picture_size_validation
    errors[:photo_picture, "Photo"] << "should be less than 1MB" if photo_picture.size > 1.megabyte
  end

end
