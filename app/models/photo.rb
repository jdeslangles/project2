class Photo < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable
  # acts_as_taggable_on :photo_tags

  attr_accessible :description, :name, :photo_picture, :album_id, :tag_list

  mount_uploader :photo_picture, PhotoPictureUploader

  validates :name, presence: true
  validates :description, length:{ maximum: 250,
  	too_long: "%{count} characters is the maximum allowed."}
  validates :photo_picture, presence: true

  belongs_to :album
  has_many :comments

end
