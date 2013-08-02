class Photo < ActiveRecord::Base

  attr_accessible :description, :name
  
  validates :name, presence: true
  validates :description, length:{ maximum: 250,
  	too_long: "%{count} characters is the maximum allowed"}
  validates :photo_picture, presence: true

  belongs_to :album
  has_many :comments
  
end
