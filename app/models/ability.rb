class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role? "registered"
      can :read, :all
      can :create, Comment
      can :destroy, Comment do |c|
        (c.photo.user_id == user_id if (c.photo and c.photo.user)) || c.user_id ==user_id
      can :manage, Album 
      can :manage, Photo
      end
      can :manage, User do |u|
        u.id == user.id
      end
    elsif user.role? "admin"
      can :manage, :all
    else
      can :read, :all
      can :create, User
    end
  end
end
