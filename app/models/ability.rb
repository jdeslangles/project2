class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role? "admin"
      can :manage, :all
    elsif user.role? "registered"
      can :read, :all
      can :create, Comment
      can :manage, Album 
      can :manage, User do |u|
        u.id == user.id
      end
    else
      can :read, :all
      can :photo_wall, Photo
      can :create, User
    end
  end
end
