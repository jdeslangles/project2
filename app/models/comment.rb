class Comment < ActiveRecord::Base

	attr_accessible :content

	validates :content, presence: true, length:{in:(5..500)}

	belongs_to :user
	belongs_to :photo
  
end
