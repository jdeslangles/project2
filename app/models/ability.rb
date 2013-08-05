class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role? "admin"
      can :manage, :all
    elsif user.role? "registered"
      can :manage, User do |u|
        u.id == user.id
      end
      can :vote, Photo
      can :read, :all
      can :create, Comment
      can :destroy, Comment
      can :manage, Album do |a|
        a.user.id == user.id
      end
      can :manage, Photo do |p|
        p.album.user.id == user.id
      end

    else
      can :read, :all
      can :photo_wall, Photo
      can :create, User
      can :photo_wall, Photo
    end
  end
end
