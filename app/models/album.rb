class Album < ActiveRecord::Base

  attr_accessible :description, :name, :privacy, :user_id

  validates :name, presence: true, length:{in:(2..20)}
  validates :description, length:{ maximum: 250,
  	too_long: "%{count} characters is the maximum allowed"}
  validates :privacy, presence: true

  belongs_to :user
  has_many :photos

 accepts_nested_attributes_for :photos

end
