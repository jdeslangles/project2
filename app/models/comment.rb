class Comment < ActiveRecord::Base

  attr_accessible :content, :user_id, :photo_id

  validates :content, presence: true, length:{maximum:500}

  belongs_to :user
  belongs_to :photo

end
