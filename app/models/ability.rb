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
      can :like, Photo
      can :unlike, Photo
      can :read, :all
      can :create, Comment
      can :manage, Album
      can :manage, Photo
      can :destroy, Comment do |c|
        (c.photo.album.user.id == user.id if (c.photo and c.photo.album.user)) || c.user.id == user.id
      end

    else
      can :read, :all
      can :photo_wall, Photo
      can [:create, :about, :thanks_for_registering], User
      can :photo_wall, Photo
    end
  end
end
