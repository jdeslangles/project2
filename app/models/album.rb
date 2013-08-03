class Album < ActiveRecord::Base

  attr_accessible :description, :name, :privacy, :user_id

  validates :name, presence: true, length:{in:(2..40)}
  validates :description, length:{ maximum: 250,
  	too_long: "%{count} characters is the maximum allowed."}

  belongs_to :user
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

end
