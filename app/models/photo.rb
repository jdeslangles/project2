class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :comments
  attr_accessible :description, :name
end
